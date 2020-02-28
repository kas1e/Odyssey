#!/usr/bin/python

# Copyright (C) 2010 Pleyo.  All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1.  Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
# 2.  Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
# 3.  Neither the name of Pleyo nor the names of
#     its contributors may be used to endorse or promote products derived
#     from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY PLEYO AND ITS CONTRIBUTORS "AS IS" AND ANY
# EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL PLEYO OR ITS CONTRIBUTORS BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import optparse
import os
import shutil

parser = optparse.OptionParser()
parser.add_option('--with-sunspider-dir', action = 'store', type = 'string', dest = 'sunspider', metavar = 'DIR', default = './', help = 'SunSpider DIR [default = %default]')
parser.add_option('--with-hosted-dir', action = 'store', type = 'string', dest = 'hosted', metavar = 'DIR', default = './hosted', help = 'DIR to store generated files [default = %default]')
(options, args) = parser.parse_args()

sunspiderDir = os.path.abspath(options.sunspider) + '/'
hostedDir = os.path.abspath(options.hosted) + '/'
if not os.path.exists(hostedDir):
    os.makedirs(hostedDir, 0755)

template = open(sunspiderDir + 'resources/TEMPLATE.html', 'r')
templateBuffer = template.read()
template.close()

tests = []
categories = []
testList = open(sunspiderDir + 'tests/LIST', 'r')
for line in testList:
    tests.append(line.rstrip())
    category = tests[-1].split('-')[0]
    if not category in categories:
        categories.append(category)
testList.close()

for test in tests:
    script = open(sunspiderDir + 'tests/' + test + '.js', 'r')
    scriptBuffer = script.read()
    script.close()

    tmpBuffer = templateBuffer.replace('@NAME@', test)
    outputBuffer = tmpBuffer.replace('@SCRIPT@', scriptBuffer)

    output = open(hostedDir + test + '.html', 'w')
    output.write(outputBuffer)
    output.close()

prefixBuffer = 'var tests = ' + str(tests) + ';\n'
prefixBuffer += 'var categories = ' + str(categories) + ';\n'

prefix = open(hostedDir + 'sunspider-test-prefix.js', 'w')
prefix.write(prefixBuffer)
prefix.close()

if not os.path.samefile(hostedDir, sunspiderDir + 'hosted'):
    for file in os.listdir(sunspiderDir + 'hosted'):
        if os.path.isfile(sunspiderDir + 'hosted/' + file):
            shutil.copy(sunspiderDir + 'hosted/' + file, hostedDir)
shutil.copy(sunspiderDir + 'resources/sunspider-analyze-results.js', hostedDir)
shutil.copy(sunspiderDir + 'resources/sunspider-compare-results.js', hostedDir)

print hostedDir + 'sunspider.html is ready to use.'
