# Copyright (C) 2011 Apple Inc. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY APPLE INC. AND ITS CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL APPLE INC. OR ITS CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
# THE POSSIBILITY OF SUCH DAMAGE.

require "config"
require "ast"
require "opt"

class Node
    def ppcSingle
        doubleOperand = ppcOperand
        raise "Bogus register name #{doubleOperand}" unless doubleOperand =~ /^d/
        "s" + ($~.post_match.to_i * 2).to_s
    end
end

class SpecialRegister < NoChildren
    def ppcOperand
        @name
    end
end

ppc_EXTRA_GPRS = [SpecialRegister.new("r10"), SpecialRegister.new("r9"), SpecialRegister.new("r8")]
ppc_EXTRA_FPRS = [SpecialRegister.new("f13"), SpecialRegister.new("f12"), SpecialRegister.new("f11"), SpecialRegister.new("f10"), SpecialRegister.new("f9"), SpecialRegister.new("f8"), SpecialRegister.new("f7")]
ppc_SCRATCH_FPR = SpecialRegister.new("f0")

def ppcMoveImmediate(value, register)
    if (value & 0xffff8000) || (value & 0xffff8000) == 0xffff8000
        $asm.puts "addi #{register.ppcOperand}, \##{value}"
    elsif !(im & 0x0000ffff)
        $asm.puts "addis #{register.ppcOperand}, \##{value >> 16}"
    else
        $asm.puts "addis #{register.ppcOperand}, \##{value >> 16}"
        $asm.puts "ori #{register.ppcOperand}, #{register.ppcOperand}, \##{value & 0x0000ffff}"
    end
end

class RegisterID
    def ppcOperand
        case name
        when "t0", "a0", "r0"
            "r3"
        when "t1", "a1", "r1"
            "r4"
        when "t2"
            "r5"
        when "t3"
            "r6"
        when "t4"
            "r7"
        when "cfr"
            "r0"
        when "lr"
            "lr"
        when "sp"
            "r1"
        else
            raise "Bad register #{name} for ppc at #{codeOriginString}"
        end
    end
end

class FPRegisterID
    def ppcOperand
        case name
        when "ft0", "fa0", "fr"
            "f1"
        when "ft1", "fa1"
            "f2"
        when "ft2"
            "f3"
        when "ft3"
            "f4"
        when "ft4"
            "f5"
        when "ft5"
            "f6"
        else
            raise "Bad register #{name} for ppc at #{codeOriginString}"
        end
    end
end

class Immediate
    def ppcOperand
        raise "Invalid immediate #{value} at #{codeOriginString}" if value < 0 or value > 255
        "\##{value}"
    end
end

class Address
    def ppcOperand
        raise "Bad offset at #{codeOriginString}" if offset.value < -0xff or offset.value > 0xfff
        "[#{base.ppcOperand}, \##{offset.value}]"
    end
end

class BaseIndex
    def ppcOperand
        raise "Bad offset at #{codeOriginString}" if offset.value != 0
        "[#{base.ppcOperand}, #{index.ppcOperand}, lsl \##{scaleShift}]"
    end
end

class AbsoluteAddress
    def ppcOperand
        raise "Unconverted absolute address at #{codeOriginString}"
    end
end

#
# Lowering of branch ops. For example:
#
# baddiz foo, bar, baz
#
# will become:
#
# addi foo, bar
# bz baz
#

def ppcLowerBranchOps(list)
    newList = []
    list.each {
        | node |
        if node.is_a? Instruction
            annotation = node.annotation
            case node.opcode
            when /^b(addi|subi|ori|addp)/
                op = $1
                branch = "b" + $~.post_match

                case op
                when "addi", "addp"
                    op = "addis"
                when "subi"
                    op = "subis"
                when "ori"
                    op = "oris"
                end

                newList << Instruction.new(node.codeOrigin, op, node.operands[0..-2], annotation)
                newList << Instruction.new(node.codeOrigin, branch, [node.operands[-1]])
            when "bmulio"
                tmp1 = Tmp.new(node.codeOrigin, :gpr)
                tmp2 = Tmp.new(node.codeOrigin, :gpr)
                newList << Instruction.new(node.codeOrigin, "smulli", [node.operands[0], node.operands[1], node.operands[1], tmp1], annotation)
                newList << Instruction.new(node.codeOrigin, "rshifti", [node.operands[-2], Immediate.new(node.codeOrigin, 31), tmp2])
                newList << Instruction.new(node.codeOrigin, "bineq", [tmp1, tmp2, node.operands[-1]])
            when /^bmuli/
                condition = $~.post_match
                newList << Instruction.new(node.codeOrigin, "muli", node.operands[0..-2], annotation)
                newList << Instruction.new(node.codeOrigin, "bti" + condition, [node.operands[-2], node.operands[-1]])
            else
                newList << node
            end
        else
            newList << node
        end
    }
    newList
end

#
# Lowering of shift ops. For example:
#
# lshifti foo, bar
#
# will become:
#
# andi foo, 31, tmp
# lshifti tmp, bar
#

def ppcSanitizeShift(operand, list)
    return operand if operand.immediate?

    tmp = Tmp.new(operand.codeOrigin, :gpr)
    list << Instruction.new(operand.codeOrigin, "andi", [operand, Immediate.new(operand.codeOrigin, 31), tmp])
    tmp
end

def ppcLowerShiftOps(list)
    newList = []
    list.each {
        | node |
        if node.is_a? Instruction
            case node.opcode
            when "lshifti", "rshifti", "urshifti", "lshiftp", "rshiftp", "urshiftp"
                if node.operands.size == 2
                    newList << Instruction.new(node.codeOrigin, node.opcode, [ppcSanitizeShift(node.operands[0], newList), node.operands[1]], node.annotation)
                else
                    newList << Instruction.new(node.codeOrigin, node.opcode, [node.operands[0], ppcSanitizeShift(node.operands[1], newList), node.operands[2]], node.annotation)
                    raise "Wrong number of operands for shift at #{node.codeOriginString}" unless node.operands.size == 3
                end
            else
                newList << node
            end
        else
            newList << node
        end
    }
    newList
end

#
# Lowering of malformed addresses. For example:
#
# loadp 10000[foo], bar
#
# will become:
#
# move 10000, tmp
# addp foo, tmp
# loadp 0[tmp], bar
#

class Node
    def ppcLowerMalformedAddressesRecurse(list)
        mapChildren {
            | node |
            node.ppcLowerMalformedAddressesRecurse(list)
        }
    end
end

class Address
    def ppcLowerMalformedAddressesRecurse(list)
        if offset.value < -0xff or offset.value > 0xfff
            tmp = Tmp.new(codeOrigin, :gpr)
            list << Instruction.new(codeOrigin, "move", [offset, tmp])
            list << Instruction.new(codeOrigin, "addp", [base, tmp])
            Address.new(codeOrigin, tmp, Immediate.new(codeOrigin, 0))
        else
            self
        end
    end
end

class BaseIndex
    def ppcLowerMalformedAddressesRecurse(list)
        if offset.value != 0
            tmp = Tmp.new(codeOrigin, :gpr)
            list << Instruction.new(codeOrigin, "move", [offset, tmp])
            list << Instruction.new(codeOrigin, "addp", [base, tmp])
            BaseIndex.new(codeOrigin, tmp, index, scale, Immediate.new(codeOrigin, 0))
        else
            self
        end
    end
end

class AbsoluteAddress
    def ppcLowerMalformedAddressesRecurse(list)
        tmp = Tmp.new(codeOrigin, :gpr)
        list << Instruction.new(codeOrigin, "move", [address, tmp])
        Address.new(codeOrigin, tmp, Immediate.new(codeOrigin, 0))
    end
end

def ppcLowerMalformedAddresses(list)
    newList = []
    list.each {
        | node |
        newList << node.ppcLowerMalformedAddressesRecurse(newList)
    }
    newList
end

#
# Lowering of malformed addresses in double loads and stores. For example:
#
# loadd [foo, bar, 8], baz
#
# becomes:
#
# leap [foo, bar, 8], tmp
# loadd [tmp], baz
#

class Node
    def ppcDoubleAddress(list)
        self
    end
end

class BaseIndex
    def ppcDoubleAddress(list)
        tmp = Tmp.new(codeOrigin, :gpr)
        list << Instruction.new(codeOrigin, "leap", [self, tmp])
        Address.new(codeOrigin, tmp, Immediate.new(codeOrigin, 0))
    end
end

def ppcLowerMalformedAddressesDouble(list)
    newList = []
    list.each {
        | node |
        if node.is_a? Instruction
            case node.opcode
            when "loadd"
                newList << Instruction.new(node.codeOrigin, "loadd", [node.operands[0].ppcDoubleAddress(newList), node.operands[1]], node.annotation)
            when "stored"
                newList << Instruction.new(node.codeOrigin, "stored", [node.operands[0], node.operands[1].ppcDoubleAddress(newList)], node.annotation)
            else
                newList << node
            end
        else
            newList << node
        end
    }
    newList
end

#
# Lowering of misplaced immediates. For example:
#
# storei 0, [foo]
#
# will become:
#
# move 0, tmp
# storei tmp, [foo]
#

def ppcLowerMisplacedImmediates(list)
    newList = []
    list.each {
        | node |
        if node.is_a? Instruction
            case node.opcode
            when "storei", "storep"
                operands = node.operands
                newOperands = []
                operands.each {
                    | operand |
                    if operand.is_a? Immediate
                        tmp = Tmp.new(operand.codeOrigin, :gpr)
                        newList << Instruction.new(operand.codeOrigin, "move", [operand, tmp])
                        newOperands << tmp
                    else
                        newOperands << operand
                    end
                }
                newList << Instruction.new(node.codeOrigin, node.opcode, newOperands, node.annotation)
            else
                newList << node
            end
        else
            newList << node
        end
    }
    newList
end

#
# Lowering of malformed immediates except when used in a "move" instruction.
# For example:
#
# addp 642641, foo
#
# will become:
#
# move 642641, tmp
# addp tmp, foo
#

class Node
    def ppcLowerMalformedImmediatesRecurse(list)
        mapChildren {
            | node |
            node.ppcLowerMalformedImmediatesRecurse(list)
        }
    end
end

class Address
    def ppcLowerMalformedImmediatesRecurse(list)
        self
    end
end

class BaseIndex
    def ppcLowerMalformedImmediatesRecurse(list)
        self
    end
end

class AbsoluteAddress
    def ppcLowerMalformedImmediatesRecurse(list)
        self
    end
end

class Immediate
    def ppcLowerMalformedImmediatesRecurse(list)
        if value < 0 or value > 255
            tmp = Tmp.new(codeOrigin, :gpr)
            list << Instruction.new(codeOrigin, "move", [self, tmp])
            tmp
        else
            self
        end
    end
end

def ppcLowerMalformedImmediates(list)
    newList = []
    list.each {
        | node |
        if node.is_a? Instruction
            annotation = node.annotation
            case node.opcode
            when "move"
                newList << node
            when "addi", "addp", "addis", "subi", "subp", "subis"
                if node.operands[0].is_a? Immediate and
                        node.operands[0].value < 0 and
                        node.operands[0].value >= 255 and
                        node.operands.size == 2
                    if node.opcode =~ /add/
                        newOpcode = "sub" + node.opcode[-1..-1]
                    else
                        newOpcode = "add" + node.opcode[-1..-1]
                    end
                    newList << Instruction.new(node.codeOrigin, newOpcode,
                                               [Immediate.new(-node.operands[0].value)] + node.operands[1..-1],
                                               annotation)
                else
                    newList << node.ppcLowerMalformedImmediatesRecurse(newList)
                end
            when "muli", "mulp"
                if node.operands[0].is_a? Immediate
                    tmp = Tmp.new(codeOrigin, :gpr)
                    newList << Instruction.new(node.codeOrigin, "move", [node.operands[0], tmp], annotation)
                    newList << Instruction.new(node.codeOrigin, "muli", [tmp] + node.operands[1..-1])
                else
                    newList << node.ppcLowerMalformedImmediatesRecurse(newList)
                end
            else
                newList << node.ppcLowerMalformedImmediatesRecurse(newList)
            end
        else
            newList << node
        end
    }
    newList
end

#
# Lowering of misplaced addresses. For example:
#
# addi foo, [bar]
#
# will become:
#
# loadi [bar], tmp
# addi foo, tmp
# storei tmp, [bar]
#
# Another example:
#
# addi [foo], bar
#
# will become:
#
# loadi [foo], tmp
# addi tmp, bar
#

def ppcAsRegister(preList, postList, operand, suffix, needStore)
    return operand unless operand.address?

    tmp = Tmp.new(operand.codeOrigin, if suffix == "d" then :fpr else :gpr end)
    preList << Instruction.new(operand.codeOrigin, "load" + suffix, [operand, tmp])
    if needStore
        postList << Instruction.new(operand.codeOrigin, "store" + suffix, [tmp, operand])
    end
    tmp
end

def ppcAsRegisters(preList, postList, operands, suffix)
    newOperands = []
    operands.each_with_index {
        | operand, index |
        newOperands << ppcAsRegister(preList, postList, operand, suffix, index == operands.size - 1)
    }
    newOperands
end

def ppcLowerMisplacedAddresses(list)
    newList = []
    list.each {
        | node |
        if node.is_a? Instruction
            postInstructions = []
            annotation = node.annotation
            case node.opcode
            when "addi", "addp", "addis", "andi", "andp", "lshifti", "lshiftp", "muli", "mulp", "negi",
                "negp", "noti", "ori", "oris", "orp", "rshifti", "urshifti", "rshiftp", "urshiftp", "subi",
                "subp", "subis", "xori", "xorp", /^bi/, /^bp/, /^bti/, /^btp/, /^ci/, /^cp/, /^ti/
                newList << Instruction.new(node.codeOrigin,
                                           node.opcode,
                                           ppcAsRegisters(newList, postInstructions, node.operands, "i"),
                                           annotation)
            when "bbeq", "bbneq", "bba", "bbaeq", "bbb", "bbbeq", "btbo", "btbz", "btbnz", "tbz", "tbnz",
                "tbo", "cbeq", "cbneq", "cba", "cbaeq", "cbb", "cbbeq"
                newList << Instruction.new(node.codeOrigin,
                                           node.opcode,
                                           ppcAsRegisters(newList, postInstructions, node.operands, "b"),
                                           annotation)
            when "bbgt", "bbgteq", "bblt", "bblteq", "btbs", "tbs", "cbgt", "cbgteq", "cblt", "cblteq"
                newList << Instruction.new(node.codeOrigin,
                                           node.opcode,
                                           ppcAsRegisters(newList, postInstructions, node.operands, "bs"),
                                           annotation)
            when "addd", "divd", "subd", "muld", "sqrtd", /^bd/
                newList << Instruction.new(node.codeOrigin,
                                           node.opcode,
                                           ppcAsRegisters(newList, postInstructions, node.operands, "d"),
                                           annotation)
            when "jmp", "call"
                newList << Instruction.new(node.codeOrigin,
                                           node.opcode,
                                           [ppcAsRegister(newList, postInstructions, node.operands[0], "p", false)],
                                           annotation)
            else
                newList << node
            end
            newList += postInstructions
        else
            newList << node
        end
    }
    newList
end

#
# Lowering of register reuse in compare instructions. For example:
#
# cieq t0, t1, t0
#
# will become:
#
# mov tmp, t0
# cieq tmp, t1, t0
#

def ppcLowerRegisterReuse(list)
    newList = []
    list.each {
        | node |
        if node.is_a? Instruction
            annotation = node.annotation
            case node.opcode
            when "cieq", "cineq", "cia", "ciaeq", "cib", "cibeq", "cigt", "cigteq", "cilt", "cilteq",
                "cpeq", "cpneq", "cpa", "cpaeq", "cpb", "cpbeq", "cpgt", "cpgteq", "cplt", "cplteq",
                "tio", "tis", "tiz", "tinz", "tbo", "tbs", "tbz", "tbnz", "tpo", "tps", "tpz", "tpnz",
                "cbeq", "cbneq", "cba", "cbaeq", "cbb", "cbbeq", "cbgt", "cbgteq", "cblt", "cblteq"
                if node.operands.size == 2
                    if node.operands[0] == node.operands[1]
                        tmp = Tmp.new(node.codeOrigin, :gpr)
                        newList << Instruction.new(node.codeOrigin, "move", [node.operands[0], tmp], annotation)
                        newList << Instruction.new(node.codeOrigin, node.opcode, [tmp, node.operands[1]])
                    else
                        newList << node
                    end
                else
                    raise "Wrong number of arguments at #{node.codeOriginString}" unless node.operands.size == 3
                    if node.operands[0] == node.operands[2]
                        tmp = Tmp.new(node.codeOrigin, :gpr)
                        newList << Instruction.new(node.codeOrigin, "move", [node.operands[0], tmp], annotation)
                        newList << Instruction.new(node.codeOrigin, node.opcode, [tmp, node.operands[1], node.operands[2]])
                    elsif node.operands[1] == node.operands[2]
                        tmp = Tmp.new(node.codeOrigin, :gpr)
                        newList << Instruction.new(node.codeOrigin, "move", [node.operands[1], tmp], annotation)
                        newList << Instruction.new(node.codeOrigin, node.opcode, [node.operands[0], tmp, node.operands[2]])
                    else
                        newList << node
                    end
                end
            else
                newList << node
            end
        else
            newList << node
        end
    }
    newList
end

#
# Lea support.
#

class Address
    def ppcEmitLea(destination)
        if destination == base
            $asm.puts "adds #{destination.ppcOperand}, \##{offset.value}"
        else
            $asm.puts "adds #{destination.ppcOperand}, #{base.ppcOperand}, \##{offset.value}"
        end
    end
end

class BaseIndex
    def ppcEmitLea(destination)
        raise "Malformed BaseIndex, offset should be zero at #{codeOriginString}" unless offset.value == 0
        $asm.puts "add.w #{destination.ppcOperand}, #{base.ppcOperand}, #{index.ppcOperand}, lsl \##{scaleShift}"
    end
end

# FIXME: we could support AbsoluteAddress for lea, but we don't.

#
# Actual lowering code follows.
#

class Sequence
    def getModifiedListppc
        myList = @list

        # Verify that we will only see instructions and labels.
        myList.each {
            | node |
            unless node.is_a? Instruction or
                    node.is_a? Label or
                    node.is_a? LocalLabel or
                    node.is_a? Skip
                raise "Unexpected #{node.inspect} at #{node.codeOrigin}"
            end
        }

        myList = ppcLowerBranchOps(myList)
        myList = ppcLowerShiftOps(myList)
        myList = ppcLowerMalformedAddresses(myList)
        myList = ppcLowerMalformedAddressesDouble(myList)
        myList = ppcLowerMisplacedImmediates(myList)
        myList = ppcLowerMalformedImmediates(myList)
        myList = ppcLowerMisplacedAddresses(myList)
        myList = ppcLowerRegisterReuse(myList)
        myList = assignRegistersToTemporaries(myList, :gpr, ppc_EXTRA_GPRS)
        myList = assignRegistersToTemporaries(myList, :fpr, ppc_EXTRA_FPRS)

        return myList
    end
end

def ppcOperands(operands)
    operands.map{|v| v.ppcOperand}.join(", ")
end

def ppcFlippedOperands(operands)
    ppcOperands([operands[-1]] + operands[0..-2])
end

def emitppcCompact(opcode2, opcode3, operands)
    if operands.size == 3
        $asm.puts "#{opcode3} #{ppcFlippedOperands(operands)}"
    else
        raise unless operands.size == 2
        raise unless operands[1].is_a? RegisterID
        if operands[0].is_a? Immediate
            $asm.puts "#{opcode3} #{operands[1].ppcOperand}, #{operands[1].ppcOperand}, #{operands[0].ppcOperand}"
        else
            $asm.puts "#{opcode2} #{ppcFlippedOperands(operands)}"
        end
    end
end

def emitppc(opcode, operands)
    if operands.size == 3
        $asm.puts "#{opcode} #{ppcFlippedOperands(operands)}"
    else
        raise unless operands.size == 2
        $asm.puts "#{opcode} #{operands[1].ppcOperand}, #{operands[1].ppcOperand}, #{operands[0].ppcOperand}"
    end
end

def emitppcDoubleBranch(branchOpcode, operands)
    $asm.puts "vcmpe.f64 #{ppcOperands(operands[0..1])}"
    $asm.puts "vmrs apsr_nzcv, fpscr"
    $asm.puts "#{branchOpcode} #{operands[2].asmLabel}"
end

def emitppcTest(operands)
    value = operands[0]
    case operands.size
    when 2
        mask = Immediate.new(codeOrigin, -1)
    when 3
        mask = operands[1]
    else
        raise "Expected 2 or 3 operands but got #{operands.size} at #{codeOriginString}"
    end

    if mask.is_a? Immediate and mask.value == -1
        $asm.puts "tst #{value.ppcOperand}, #{value.ppcOperand}"
    elsif mask.is_a? Immediate
        $asm.puts "tst.w #{value.ppcOperand}, #{mask.ppcOperand}"
    else
        $asm.puts "tst #{value.ppcOperand}, #{mask.ppcOperand}"
    end
end

def emitppcCompare(operands, code)
    $asm.puts "movs #{operands[2].ppcOperand}, \#0"
    $asm.puts "cmp #{operands[0].ppcOperand}, #{operands[1].ppcOperand}"
    $asm.puts "it #{code}"
    $asm.puts "mov#{code} #{operands[2].ppcOperand}, \#1"
end

def emitppcTestSet(operands, code)
    $asm.puts "movs #{operands[-1].ppcOperand}, \#0"
    emitppcTest(operands)
    $asm.puts "it #{code}"
    $asm.puts "mov#{code} #{operands[-1].ppcOperand}, \#1"
end

class Instruction
    def lowerppc
        $asm.codeOrigin codeOriginString if $enableCodeOriginComments
        $asm.annotation annotation if $enableInstrAnnotations

        case opcode
        when "addi", "addp", "addis"
            if opcode == "addis"
                suffix = "s"
            else
                suffix = ""
            end
            if operands.size == 3 and operands[0].is_a? Immediate
                raise unless operands[1].is_a? RegisterID
                raise unless operands[2].is_a? RegisterID
                if operands[0].value == 0 and suffix.empty?
                    unless operands[1] == operands[2]
                        $asm.puts "mov #{operands[2].ppcOperand}, #{operands[1].ppcOperand}"
                    end
                else
                    $asm.puts "adds #{operands[2].ppcOperand}, #{operands[1].ppcOperand}, #{operands[0].ppcOperand}"
                end
            elsif operands.size == 3 and operands[0].is_a? RegisterID
                raise unless operands[1].is_a? RegisterID
                raise unless operands[2].is_a? RegisterID
                $asm.puts "adds #{ppcFlippedOperands(operands)}"
            else
                if operands[0].is_a? Immediate
                    unless Immediate.new(nil, 0) == operands[0]
                        $asm.puts "adds #{ppcFlippedOperands(operands)}"
                    end
                else
                    $asm.puts "add#{suffix} #{ppcFlippedOperands(operands)}"
                end
            end
        when "andi", "andp"
            emitppcCompact("ands", "and", operands)
        when "ori", "orp"
            emitppcCompact("orrs", "orr", operands)
        when "oris"
            emitppcCompact("orrs", "orrs", operands)
        when "xori", "xorp"
            emitppcCompact("eors", "eor", operands)
        when "lshifti", "lshiftp"
            emitppcCompact("lsls", "lsls", operands)
        when "rshifti", "rshiftp"
            emitppcCompact("asrs", "asrs", operands)
        when "urshifti", "urshiftp"
            emitppcCompact("lsrs", "lsrs", operands)
        when "muli", "mulp"
            emitppc("mul", operands)
        when "subi", "subp", "subis"
            emitppcCompact("subs", "subs", operands)
        when "negi", "negp"
            $asm.puts "rsbs #{operands[0].ppcOperand}, #{operands[0].ppcOperand}, \#0"
        when "noti"
            $asm.puts "mvns #{operands[0].ppcOperand}, #{operands[0].ppcOperand}"
        when "loadi", "loadis", "loadp"
            $asm.puts "ldr #{ppcFlippedOperands(operands)}"
        when "storei", "storep"
            $asm.puts "str #{ppcOperands(operands)}"
        when "loadb"
            $asm.puts "ldrb #{ppcFlippedOperands(operands)}"
        when "loadbs"
            $asm.puts "ldrsb.w #{ppcFlippedOperands(operands)}"
        when "storeb"
            $asm.puts "strb #{ppcOperands(operands)}"
        when "loadh"
            $asm.puts "ldrh #{ppcFlippedOperands(operands)}"
        when "loadhs"
            $asm.puts "ldrsh.w #{ppcFlippedOperands(operands)}"
        when "storeh"
            $asm.puts "strh #{ppcOperands(operands)}"
        when "loadd"
            $asm.puts "vldr.64 #{ppcFlippedOperands(operands)}"
        when "stored"
            $asm.puts "vstr.64 #{ppcOperands(operands)}"
        when "addd"
            emitppc("vadd.f64", operands)
        when "divd"
            emitppc("vdiv.f64", operands)
        when "subd"
            emitppc("vsub.f64", operands)
        when "muld"
            emitppc("vmul.f64", operands)
        when "sqrtd"
            $asm.puts "vsqrt.f64 #{ppcFlippedOperands(operands)}"
        when "ci2d"
            $asm.puts "vmov #{operands[1].ppcSingle}, #{operands[0].ppcOperand}"
            $asm.puts "vcvt.f64.s32 #{operands[1].ppcOperand}, #{operands[1].ppcSingle}"
        when "bdeq"
            emitppcDoubleBranch("beq", operands)
        when "bdneq"
            $asm.puts "vcmpe.f64 #{ppcOperands(operands[0..1])}"
            $asm.puts "vmrs apsr_nzcv, fpscr"
            isUnordered = LocalLabel.unique("bdneq")
            $asm.puts "bvs #{LabelReference.new(codeOrigin, isUnordered).asmLabel}"
            $asm.puts "bne #{operands[2].asmLabel}"
            isUnordered.lower("ppc")
        when "bdgt"
            emitppcDoubleBranch("bgt", operands)
        when "bdgteq"
            emitppcDoubleBranch("bge", operands)
        when "bdlt"
            emitppcDoubleBranch("bmi", operands)
        when "bdlteq"
            emitppcDoubleBranch("bls", operands)
        when "bdequn"
            $asm.puts "vcmpe.f64 #{ppcOperands(operands[0..1])}"
            $asm.puts "vmrs apsr_nzcv, fpscr"
            $asm.puts "bvs #{operands[2].asmLabel}"
            $asm.puts "beq #{operands[2].asmLabel}"
        when "bdnequn"
            emitppcDoubleBranch("bne", operands)
        when "bdgtun"
            emitppcDoubleBranch("bhi", operands)
        when "bdgtequn"
            emitppcDoubleBranch("bpl", operands)
        when "bdltun"
            emitppcDoubleBranch("blt", operands)
        when "bdltequn"
            emitppcDoubleBranch("ble", operands)
        when "btd2i"
            # FIXME: may be a good idea to just get rid of this instruction, since the interpreter
            # currently does not use it.
            raise "ppc does not support this opcode yet, #{codeOrigin}"
        when "td2i"
            $asm.puts "vcvt.s32.f64 #{ppc_SCRATCH_FPR.ppcSingle}, #{operands[0].ppcOperand}"
            $asm.puts "vmov #{operands[1].ppcOperand}, #{ppc_SCRATCH_FPR.ppcSingle}"
        when "bcd2i"
            $asm.puts "vcvt.s32.f64 #{ppc_SCRATCH_FPR.ppcSingle}, #{operands[0].ppcOperand}"
            $asm.puts "vmov #{operands[1].ppcOperand}, #{ppc_SCRATCH_FPR.ppcSingle}"
            $asm.puts "vcvt.f64.s32 #{ppc_SCRATCH_FPR.ppcOperand}, #{ppc_SCRATCH_FPR.ppcSingle}"
            emitppcDoubleBranch("bne", [ppc_SCRATCH_FPR, operands[0], operands[2]])
            $asm.puts "tst #{operands[1].ppcOperand}, #{operands[1].ppcOperand}"
            $asm.puts "beq #{operands[2].asmLabel}"
        when "movdz"
            # FIXME: either support this or remove it.
            raise "ppc does not support this opcode yet, #{codeOrigin}"
        when "pop"
            $asm.puts "pop #{operands[0].ppcOperand}"
        when "push"
            $asm.puts "push #{operands[0].ppcOperand}"
        when "move", "sxi2p", "zxi2p"
            if operands[0].is_a? Immediate
                ppcMoveImmediate(operands[0].value, operands[1])
            else
                $asm.puts "mov #{ppcFlippedOperands(operands)}"
            end
        when "nop"
            $asm.puts "nop"
        when "bieq", "bpeq", "bbeq"
            if Immediate.new(nil, 0) == operands[0]
                $asm.puts "tst #{operands[1].ppcOperand}, #{operands[1].ppcOperand}"
            elsif Immediate.new(nil, 0) == operands[1]
                $asm.puts "tst #{operands[0].ppcOperand}, #{operands[0].ppcOperand}"
            else
                $asm.puts "cmp #{ppcOperands(operands[0..1])}"
            end
            $asm.puts "beq #{operands[2].asmLabel}"
        when "bineq", "bpneq", "bbneq"
            if Immediate.new(nil, 0) == operands[0]
                $asm.puts "tst #{operands[1].ppcOperand}, #{operands[1].ppcOperand}"
            elsif Immediate.new(nil, 0) == operands[1]
                $asm.puts "tst #{operands[0].ppcOperand}, #{operands[0].ppcOperand}"
            else
                $asm.puts "cmp #{ppcOperands(operands[0..1])}"
            end
            $asm.puts "bne #{operands[2].asmLabel}"
        when "bia", "bpa", "bba"
            $asm.puts "cmp #{ppcOperands(operands[0..1])}"
            $asm.puts "bhi #{operands[2].asmLabel}"
        when "biaeq", "bpaeq", "bbaeq"
            $asm.puts "cmp #{ppcOperands(operands[0..1])}"
            $asm.puts "bhs #{operands[2].asmLabel}"
        when "bib", "bpb", "bbb"
            $asm.puts "cmp #{ppcOperands(operands[0..1])}"
            $asm.puts "blo #{operands[2].asmLabel}"
        when "bibeq", "bpbeq", "bbbeq"
            $asm.puts "cmp #{ppcOperands(operands[0..1])}"
            $asm.puts "bls #{operands[2].asmLabel}"
        when "bigt", "bpgt", "bbgt"
            $asm.puts "cmp #{ppcOperands(operands[0..1])}"
            $asm.puts "bgt #{operands[2].asmLabel}"
        when "bigteq", "bpgteq", "bbgteq"
            $asm.puts "cmp #{ppcOperands(operands[0..1])}"
            $asm.puts "bge #{operands[2].asmLabel}"
        when "bilt", "bplt", "bblt"
            $asm.puts "cmp #{ppcOperands(operands[0..1])}"
            $asm.puts "blt #{operands[2].asmLabel}"
        when "bilteq", "bplteq", "bblteq"
            $asm.puts "cmp #{ppcOperands(operands[0..1])}"
            $asm.puts "ble #{operands[2].asmLabel}"
        when "btiz", "btpz", "btbz"
            emitppcTest(operands)
            $asm.puts "beq #{operands[-1].asmLabel}"
        when "btinz", "btpnz", "btbnz"
            emitppcTest(operands)
            $asm.puts "bne #{operands[-1].asmLabel}"
        when "btio", "btpo", "btbo"
            emitppcTest(operands)
            $asm.puts "bvs #{operands[-1].asmLabel}"
        when "btis", "btps", "btbs"
            emitppcTest(operands)
            $asm.puts "bmi #{operands[-1].asmLabel}"
        when "jmp"
            if operands[0].label?
                $asm.puts "b #{operands[0].asmLabel}"
            else
                $asm.puts "mov pc, #{operands[0].ppcOperand}"
            end
        when "call"
            if operands[0].label?
                $asm.puts "blx #{operands[0].asmLabel}"
            else
                $asm.puts "blx #{operands[0].ppcOperand}"
            end
        when "break"
            $asm.puts "bkpt #0"
        when "ret"
            $asm.puts "bx lr"
        when "cieq", "cpeq", "cbeq"
            emitppcCompare(operands, "eq")
        when "cineq", "cpneq", "cbneq"
            emitppcCompare(operands, "ne")
        when "cia", "cpa", "cba"
            emitppcCompare(operands, "hi")
        when "ciaeq", "cpaeq", "cbaeq"
            emitppcCompare(operands, "hs")
        when "cib", "cpb", "cbb"
            emitppcCompare(operands, "lo")
        when "cibeq", "cpbeq", "cbbeq"
            emitppcCompare(operands, "ls")
        when "cigt", "cpgt", "cbgt"
            emitppcCompare(operands, "gt")
        when "cigteq", "cpgteq", "cbgteq"
            emitppcCompare(operands, "ge")
        when "cilt", "cplt", "cblt"
            emitppcCompare(operands, "lt")
        when "cilteq", "cplteq", "cblteq"
            emitppcCompare(operands, "le")
        when "tio", "tbo", "tpo"
            emitppcTestSet(operands, "vs")
        when "tis", "tbs", "tps"
            emitppcTestSet(operands, "mi")
        when "tiz", "tbz", "tpz"
            emitppcTestSet(operands, "eq")
        when "tinz", "tbnz", "tpnz"
            emitppcTestSet(operands, "ne")
        when "peek"
            $asm.puts "ldr #{operands[1].ppcOperand}, [sp, \##{operands[0].value * 4}]"
        when "poke"
            $asm.puts "str #{operands[1].ppcOperand}, [sp, \##{operands[0].value * 4}]"
        when "fii2d"
            $asm.puts "vmov #{operands[2].ppcOperand}, #{operands[0].ppcOperand}, #{operands[1].ppcOperand}"
        when "fd2ii"
            $asm.puts "vmov #{operands[1].ppcOperand}, #{operands[2].ppcOperand}, #{operands[0].ppcOperand}"
        when "bo"
            $asm.puts "bvs #{operands[0].asmLabel}"
        when "bs"
            $asm.puts "bmi #{operands[0].asmLabel}"
        when "bz"
            $asm.puts "beq #{operands[0].asmLabel}"
        when "bnz"
            $asm.puts "bne #{operands[0].asmLabel}"
        when "leai", "leap"
            operands[0].ppcEmitLea(operands[1])
        when "smulli"
            raise "Wrong number of arguments to smull in #{self.inspect} at #{codeOriginString}" unless operands.length == 4
            $asm.puts "smull #{operands[2].ppcOperand}, #{operands[3].ppcOperand}, #{operands[0].ppcOperand}, #{operands[1].ppcOperand}"
        else
            lowerDefault
        end
    end
end

