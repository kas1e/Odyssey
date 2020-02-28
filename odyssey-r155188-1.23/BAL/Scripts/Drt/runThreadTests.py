import difflib
import logging
import os
import time
import thread
import threading
import subprocess

def StartTestShell(command):
    return subprocess.Popen(command, shell=True,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE,
                            close_fds=True)

class SingleTestThread(threading.Thread):
    def __init__(self, test_file, test_command):
        threading.Thread.__init__(self)
        self.test_file = test_file
        self.test_command = test_command
        self.time = 0
        self.output = ""
        self.crash = False

    def run(self):
        start_time = time.time()
        self.proc = StartTestShell(self.test_command)
        line = self.proc.stdout.readline()
        while line.rstrip() != "#EOF":
            if line == '' and self.proc.poll() is not None:
                self.crash = True
                break
            self.output += line
            line = self.proc.stdout.readline()
        end_test_time = time.time()
        self.time = end_test_time - start_time

    def getProcess(self):
        return self.proc

    def isCrashed(self):
        return self.crash
    
    def getTime(self):
        return self.time

    def getOutput(self):
        return self.output

class runTestThread(threading.Thread):
    def __init__(self, test_file, test_command, config):
        threading.Thread.__init__(self)
        self.test_file = test_file
        self.test_command = test_command
        self.config = config

        self.timeout = False
        self.failed = False
        self.platformFailed = False
        self.newTest = False
        self.diff = ""
        self.file = ""
        self.leakList = {}
        self.worker = SingleTestThread(self.test_file, self.test_command)

    def run(self):
        self.worker.start()

        # set timeout
        self.worker.join(15)
        if self.worker.isAlive():
            self.worker.getProcess().kill()
            self.timeout = True
        else:
            try :
                self.worker.getProcess().kill()
            except :
                print ""
            result, file = self.__getExpected(self.test_file)
            self.file = file
            if result :
                #compare result
                cmp, diff = self.__compareResult(self.worker.getOutput(), file)
                self.diff = diff
                res = ""
                if not cmp :
                    if (file.find("platform") == -1) :
                        self.failed = True
                    else :
                        self.platformFailed = True
            else :
                #create expected
                try :
                    os.makedirs(file[:file.rfind("/")], 0755)
                except OSError :
                    logging.warning("dir exist : " + file[:file.rfind("/")])

                f = open(file, "w")
                f.write(self.worker.getOutput())
                f.close()
                self.newTest = True

            if self.config['leak'] :
                #get LEAK
                err = self.worker.getProcess().stderr.read()
                for leak in err.split('\n') :
                    if leak.find("LEAK") != -1 :
                        le = leak.split()
                        try :
                            count = int(self.leakList[le[2]])
                        except KeyError :
                            count = 0
                        count += int(le[1])
                        self.leakList[le[2]] = count

    def isTimeouted(self):
        return self.timeout

    def isCrashed(self):
        return self.worker.isCrashed()

    def isFailed(self):
        return self.failed

    def isPlatformFailed(self):
        return self.platformFailed

    def isNewTest(self):
        return self.newTest

    def getTime(self):
        return self.worker.getTime()

    def getOutput(self):
        return self.worker.getOutput()

    def getTest(self):
        return self.test_file

    def getLeaks(self):
        return self.leakList

    def getDiff(self):
        return self.diff

    def getFile(self):
        return self.file

    def __getExpected(self, test) :
        #get extension
        ext = test[test.rfind("."):]
        expected = test.replace(ext, "-expected.txt")
        if test.find("http://") != -1 :
            if test.find("8000") != -1 :
                expected = expected.replace("http://127.0.0.1:8000", self.config['layout'] + "/http/tests")
            if test.find("8443") != -1 :
                expected = expected.replace("http://127.0.0.1:8443", self.config['layout'] + "/http/tests")
            if test.find("8880") != -1 :
                expected = expected.replace("http://127.0.0.1:8880", self.config['layout'])
        if not os.path.exists(expected) :
            dir = self.config['layout'] + "/platform/bal/" + self.config['platform'] + "/"
            file = dir + expected[len(self.config['layout']):]
            if not os.path.exists(file) :
                return False, file
            else :
                return True, file
        else :
            return True, expected

    def __compareResult(self, out, expectedFile) :
        f = open(expectedFile)
        expected = f.read()
        f.close()

        #expected = expected.strip("\r\n").replace("\r\n", "\n") + "\n"

        exp = expected.split("\r\n")
        expected = ""
        for line in exp :
            expected += line.strip() + "\n"

        output = out.split("\r\n")
        out = ""
        for o in output :
            out += o.strip() + "\n"

        if out == expected :
            return True, ""
        else :
            diff = difflib.unified_diff(expected.split("\n"), out.split("\n"))
            outDiff = ""
            for line in diff :
                outDiff += line + "\n"
            return False, outDiff

