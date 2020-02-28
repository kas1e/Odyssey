# this module extract some informations in BAL class to create unit test skeletons and header skeleton
import os

def removePlatformContentBeforeClassDefinition(content, namespace) :
    pos = 0
    while pos != -1 : 
        pos = content.find("namespace " + namespace, pos)
	if pos != -1 :
            #find if is not a using namespace
            line = content[pos:content.find("\n", pos)]
            if line.find(";") == -1 :
                break
   
    if pos != -1 :
        content = content[pos:]
    return content

def cleanContent(path) :
    f = open(path, 'r')
    content = f.read()
    f.close()

    namespace = ""
    if path.find("WebCore") != -1 :
        namespace = "WebCore"
    elif path.find("wtf") != -1 :
        namespace = "WTF"
    elif path.find("JavaScriptCore") != -1 :
        namespace = "JSC"
    content = removePlatformContentBeforeClassDefinition(content, namespace)
    return content.split('\n')

def isClass(line) :
    return (line.find("class ") != -1 or line.find("struct ") != -1)  \
        and (line.find(":") != -1 or line.find("{") != 1 or line.find("\n") != 1) \
        and line.find("//") == -1 \
        and line.find(";") == -1 \
        and line.find("typedef") == -1

#todo finish find template ( add a status variable and check if this variable is to on when you check the class or struct.
def isTemplate(line) :
    return line.find("template") != -1 or line.find("<") != -1

#get class name
def classNameList(contentList) :
    list = []
    lineCount = 0
    TemplateLine = 0
    for line in contentList :
        if isTemplate(line) :
	    TemplateLine = lineCount
	# TODO : find solution for template
        if isClass(line) and (TemplateLine != lineCount and TemplateLine != lineCount - 1) :
	    if line.find("class ") != -1 :
                pos = line.find("class ") + 6
	    elif line.find("struct ") != -1 :
                pos = line.find("struct ") + 7
	    fin = line.find(" ", pos)
	    list.append(line[pos:fin])
        lineCount += 1
    return list 

#get public methods
def publicMethodList(contentList, className) :
    list = []
    beginClass = False
    beginPublic = False
    classCount = 0
    for line in contentList :
        if isClass(line) :
	    classCount += 1
	    if line.find(className) != -1 : 
	        beginClass = True
	        print "beginClass"
	if line.find("};") != -1 :
	    classCount -= 1
	    if beginClass :
	        beginClass = False
		print "endClass"

    return list
