import os
import random

class TestsList :
    def __init__(self, config) :
        self.config = config
        self.dirOut = [".svn", "resources", "platform", "conf", "js", "script-tests"]
        self.extension = [".html", ".shtml", ".xml", ".xhtml", ".pl", ".php"]

    def changePathIfNeeded(self, li) :
        if li.find("/http") != -1 and li.find("local/") == -1:
            rpl = li[:li.find("/http/tests") + 11]
            if li.find("/http/tests/ssl") != -1 :
                li = li.replace(rpl, "http://127.0.0.1:8443")
            else :
                li = li.replace(rpl, "http://127.0.0.1:8000")
        if li.find("/websocket") != -1 :
            rpl = li[:li.find("/websocket")]
            li = li.replace(rpl, "http://127.0.0.1:8880")
        return li

    def createList(self, path = None) :
        if path is None:
            path = self.config['layout']
        dirList = os.listdir(path)
        dirList.sort()
        testsList = []
        for fname in dirList:
            if os.path.isdir(path + "/" + fname) == True :
                pathName = ""
                if path[len(path) - 1] == "/" :
                    pathName = path + fname
                else :
                    pathName = path + "/" + fname
                for li in self.createList(pathName) :
                    add = True
                    for dir in self.dirOut :
                        if li.find(dir) != -1 :
                            add = False
                    if add :
                        li = self.changePathIfNeeded(li)
                        testsList.append(li)
            else :
                #find all the .html, .shtml, .xml, .xhtml, .pl, .php (and svg) files in the test directory. 
                if fname.find("-disabled") == -1 and fname.find(".xsd") == -1 :
                    for ext in self.extension :
                        if fname.find(ext) != -1 :
                            pathName = ""
                            if path[len(path) - 1] == "/" :
                                pathName = path + fname
                            else :
                                pathName = path + "/" + fname
                            add = True
                            for dir in self.dirOut :
                                if pathName.find(dir) != -1 :
                                    add = False
                            if add :
                                pathName = self.changePathIfNeeded(pathName)
                                testsList.append(pathName)
                            break;
        self.list = testsList
        return testsList

    def constructList(self, list, ignoredDirectories, supportedFileExtensions) :
        # remove Layout Tests directory from test
        # if option is not enabled
        for feature in list:
            if not self.config[feature] and feature in ignoredDirectories.keys() :
                for dir in ignoredDirectories[feature] :
                    self.dirOut.append(dir)
            if self.config[feature] and feature in supportedFileExtensions.keys() :
                self.extension.append(supportedFileExtensions[feature])
    
    def getList(self) :
        return self.list

    def getReverseList(self) :
        l = self.list
        l.reverse()
        return l

    def getShuffleList(self) :
        l = self.list
        random.shuffle(l)
        return l
