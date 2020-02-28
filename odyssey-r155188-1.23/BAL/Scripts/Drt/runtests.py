import difflib
import logging
import multiprocessing
import os
import progress
import Queue
import runThreadTests
import signal
import subprocess
import sys
import threading
import time
from threading import Timer

def handler(signum, frame):
    raise Exception('timeout')

class RunTests :
    def __init__(self, config, testsList) :
        self.config = config
        self.testsList = testsList
        self.leakList = {}
        self.time = 0
        self.timeout = False
        self.startTime = 0
        self.resultSuccess = {}
        self.resultFailed = {}
        self.resultPlatformFailed = {}
        self.resultTimeout = {}
        self.resultCrashed = {}
        self.resultNew = {}
        self.pid = 0
        self.count = 0
        self.prog = progress.ProgressBar(0, len(testsList), 77, mode='fixed')
        self.webSocketServerRunning = False
        self.httpServerRunning = False
        self.webSocketServerPID = 0
        self.httpServerPID = 0
        os.environ["WEBKIT_TESTFONTS"]=os.path.abspath(self.config['source']) + "/Tools/DumpRenderTree/bal/fonts/"

    def startDrt(self) :
        if not os.path.exists(self.config['drt'] + "/DumpRenderTree") :
            print "DumpRenderTree are not in " + self.config['drt']
            exit(0)
        threads = []
        start = 0
        start_time = time.time()
        cpu_count = multiprocessing.cpu_count()
        while start < len(self.testsList) :
            inc = cpu_count
            if (start + inc) > len(self.testsList) :
                inc = len(self.testsList) - start
            for i in xrange(start, start + inc) :
                # we cannot have more than one thread for storage also we have lock error on base.
                if self.testsList[i].find("/storage") != -1 :
                    if i == start :
                        threads.append(self.__startTest(self.testsList[i]))
                        inc = 1;
                        break
                    else :
                        inc = i - start
                        break
                else :
                    threads.append(self.__startTest(self.testsList[i]))

            try:
                for thread in threads :
                    if thread.isAlive():
                        thread.join()
            except KeyboardInterrupt:
                #for thread in threads:
                #    thread.Cancel()
                raise

            for thread in threads:
                self.__updateProgressBar()
                if thread.isTimeouted() :
                    if self.config['verbose'] :
                        print "\n" + thread.getTest() + ": timeout"
                    self.resultTimeout[thread.getTest()] = [thread.getTime(), "", ""]
                elif thread.isCrashed() :
                    if self.config['verbose'] :
                        print "\n" + thread.getTest() + ": crashed"
                    self.resultCrashed[thread.getTest()] =  [thread.getTime(), "", ""]
                elif thread.isFailed() :
                    if self.config['verbose'] :
                        print "\n" + thread.getTest() + ": failed"
                    self.resultFailed[thread.getTest()] = [thread.getTime(), thread.getDiff(), thread.getFile()]
                elif thread.isPlatformFailed() :
                    if self.config['verbose'] :
                        print "\n" + thread.getTest() + ": platform failed"
                    self.resultPlatformFailed[thread.getTest()] = [thread.getTime(), thread.getDiff(), thread.getFile()]
                elif thread.isNewTest() :
                    if self.config['verbose'] :
                        print "\n" + thread.getTest() + ": new test"
                    self.resultNew[thread.getTest()] = [thread.getTime(), thread.getOutput(), thread.getFile()]
                else :
                    self.resultSuccess[thread.getTest()] = [thread.getTime(), thread.getDiff(), thread.getFile()]
                if self.config['leak'] :
                    for k in thread.getLeaks().keys() :
                        if not self.leakList.has_key(k):
                            self.leakList[k] = 0
                        self.leakList[k] += thread.getLeaks()[k]
           
            del threads[:]
            start += inc

        print
        print self.leakList

        stop_time = time.time()
        self.time = stop_time - start_time

        total = len(self.resultSuccess) + len(self.resultFailed) + len(self.resultPlatformFailed) + len(self.resultTimeout) + len(self.resultCrashed) + len(self.resultNew)
        print "total tests = " + str(total)
        if total :
            percentSuccess = (float(len(self.resultSuccess)) / float(total)) * 100.0
            percentFailed = (float(len(self.resultFailed)) / float(total)) * 100.0
            percentPlatformFailed = (float(len(self.resultPlatformFailed)) / float(total)) * 100.0
            percentTimeout = (float(len(self.resultTimeout)) / float(total)) * 100.0
            percentCrashed = (float(len(self.resultCrashed)) / float(total)) * 100.0
            percentNew = (float(len(self.resultNew)) / float(total)) * 100.0
        else :
            percentSuccess = 0
            percentFailed = 0
            percentPlatformFailed = 0
            percentTimeout = 0
            percentCrashed = 0
            percentNew = 0
        print "success (" + str(len(self.resultSuccess)) + ") : " + str(percentSuccess)
        print "failed (" + str(len(self.resultFailed)) + ") : " + str(percentFailed)
        print "platform failed (" + str(len(self.resultPlatformFailed)) + ") : " + str(percentPlatformFailed)
        print "timeout (" + str(len(self.resultTimeout)) + ") : " + str(percentTimeout)
        print "crashed (" + str(len(self.resultCrashed)) + ") : " + str(percentCrashed)
        print "new (" + str(len(self.resultNew)) + ") : " + str(percentNew)

        if self.time >= 3600.0 :
            print "elapsed time = " + time.strftime('%H h %M m %S s',time.localtime(self.time))
        elif self.time >= 0.01 :
            print "elapsed time = " + time.strftime('%M m %S s',time.localtime(self.time))
        else :
            print "elapsed time = " + str(self.time)

        self.__HtmlResult(self.config['output'])
        self.__stopWebSocketServer()
        self.__stopHttpServer()


    def __startTest(self, test) :
        if test.find("8880") != -1 :
            self.__startWebSocketServer()
        if test.find("8000") != -1 or test.find("8443") != -1 :
            self.__startHttpServer()
        if test.find("inspector") != -1 :
            os.environ["INSPECTOR_URL"]=self.config['source'] + "/WebCore/inspector/front-end/inspector.html"

        command = self.config['drt'] + "/DumpRenderTree " + test
        thread = runThreadTests.runTestThread(test, command, self.config);
        thread.start()
        return thread

    def __createImage(self) :
        print "create image"

    def __compareImage(self) :
        print "compare image"

    def __createChecksum(self) :
        print "create checksum"

    def __compareChecksum(self) :
        print "compare checksum"

    def __HtmlResult(self, pathToTestResult) :
        try :
            os.makedirs(pathToTestResult, 0755)
        except OSError :
            logging.warning("dir exist : " + pathToTestResult)
        f = open(pathToTestResult + "/result.html", "w")
        f.write("<html>\n")
        f.write("<head>\n")
        f.write("<title>Layout Test Results</title>\n")
        f.write("</head>\n")
        f.write("<body>\n")

        self.__htmlForResultsSection(f, self.resultFailed, "Tests where results did not match expected results", pathToTestResult);
        self.__htmlForResultsSection(f, self.resultPlatformFailed, "Tests platform specific where results did not match expected results", pathToTestResult);
        self.__htmlForResultsSection(f, self.resultTimeout, "Tests that timed out", pathToTestResult);
        self.__htmlForResultsSection(f, self.resultCrashed, "Tests that caused the DumpRenderTree tool to crash", pathToTestResult);
        self.__htmlForResultsSection(f, self.resultNew, "Tests that had no expected results (probably new)", pathToTestResult);

        f.write("</body>\n")
        f.write("</html>\n")
        f.close()

    def __htmlForResultsSection(self, file, tests, desc, pathToTestResult) :
        file.write("<p>"+desc+":</p>\n")
        file.write("<table>\n")
        keys = tests.keys()
        keys.sort()
        for test in keys :
            res = tests[test]
            file.write("<tr>\n")
            file.write("<td><a href=\"file://" + test + "\">"+test+"</a></td>")
            if res[1] != "" :
                dir = pathToTestResult + "/" + res[2][res[2].find("LayoutTests") + 11:res[2].rfind("/")]
                try :
                    os.makedirs(dir, 0755)
                except OSError :
                   logging.warning("dir exist : " + dir)
                outFile = dir + "/" +res[2][res[2].rfind("/") + 1 :] + "-diff.txt"
                f = open(outFile, "w")
                f.write(res[1])
                f.close()
                file.write("<td><a href=\"" + outFile + "\">diff</a></td>")
                file.write("<td><a href=\"" + res[2] + "\">expected</a></td>")
            file.write("</tr>")
        file.write("</table>")

    def __updateProgressBar(self) :
        self.count += 1
        oldprog = str(self.prog)
        self.prog.update_amount(self.count)
        if oldprog != str(self.prog):
            print self.prog, "\r",
            sys.stdout.flush()

    def __startWebSocketServer(self) :
        if not self.webSocketServerRunning and self.config['source'] is not None :
            self.webSocketServerRunning = True
            command = "PYTHONPATH=" + self.config['source'] + "/Tools/pywebsocket/"
            command += " python "
            command += self.config['source'] +"/Tools/pywebsocket/mod_pywebsocket/standalone.py"
            command += " -p 8880"
            command += " -d " + self.config['layout']
            command += " -s " + self.config['layout'] + "/websocket/tests"
            command += " -l /tmp/pywebsocket_log.txt"
            command += " --strict"

            out = subprocess.Popen(command, shell=True)
            self.webSocketServerPID = out.pid


    def __stopWebSocketServer(self) :
        if self.webSocketServerRunning :
            os.kill(self.webSocketServerPID, signal.SIGKILL)
            os.waitpid(-1, os.WNOHANG)
            self.webSocketServerRunning = True

    def __startHttpServer(self) :
        if not self.httpServerRunning and self.config['source'] is not None :
            conf = ""
            server = ""
            if os.path.exists("/etc/gentoo-release") :
                conf = self.config['source'] + "/BAL/Scripts/data/apache2-gentoo-httpd.conf"
                server = "/usr/sbin/apache2"
            elif os.path.exists("/etc/fedora-release") or os.path.exists("/etc/arch-release") :
                conf = self.config['layout'] + "/http/conf/fedora-httpd.conf"
                server = "/usr/sbin/httpd"
            elif os.path.exists("/etc/debian_version") :
                conf = self.config['layout'] + "/http/conf/apache2-debian-httpd.conf"
                server = "/usr/sbin/apache2"
            else :
                server = "/usr/sbin/httpd"
                conf = self.config['layout'] + "/http/conf/apache2-httpd.conf"
                

            if conf == "" :
                return
            else :
                conf = os.path.abspath(conf)

            if not os.path.exists("/tmp/WebKit") :
                os.mkdir("/tmp/WebKit/")

            self.httpServerRunning = True
            command = server
            #command += " -f " + self.config['layout'] + "/http/conf/apache2-debian-httpd.conf"
            command += " -f " + conf
            command += " -C \"DocumentRoot " + self.config['layout'] + "/http/tests\""
            command += " -c \"Alias /js-test-resources " + self.config['layout'] + "/fast/js/resources\""
            command += " -C \"Listen 127.0.0.1:8000\""
            command += " -c \"TypesConfig " + self.config['layout'] + "/http/conf/mime.types\""
            command += " -c \"CustomLog /tmp/access_log.txt common\""
            command += " -c \"ErrorLog /tmp/error_log.txt\""
            command += " -c \"SSLCertificateFile " + self.config['layout'] + "/http/conf/webkit-httpd.pem\""

            out = subprocess.Popen(command, shell=True)
            self.httpServerPID = out.pid

    def __stopHttpServer(self) :
        if self.httpServerRunning :
            f = open("/tmp/WebKit/httpd.pid")
            pid = f.read()
            f.close()

            p = int(pid)

            os.kill(p, 15)
            self.httpServerRunning = True
