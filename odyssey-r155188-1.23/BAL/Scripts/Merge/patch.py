import os
import logging
import pysvn
import re
import shutil

def createOWBPatch(url, rev) :
    logging.debug('createOWBPatch')

    logging.debug('create ' + url + '/../merge/patches')
    os.mkdir(url + "/../merge/patches")
    logging.debug('create ' + url + '/../merge/patches/bal')
    os.mkdir(url + "/../merge/patches/bal")
    logging.debug('create ' + url + '/../merge/files')
    os.mkdir(url + "/../merge/files")

    files = open(url + "/BAL/Scripts/data/WebKitFiles.txt", 'r')
    logging.debug('create patch for :')
    for file in files :
        if len(file.strip()) == 0 :
            continue
        urls = file.split()
	logging.debug(urls[0])
	if len(urls) == 2 :
	    createOWBBALPatch(url, urls[0], urls[1])
	else :
            try:
                f = urls[0][urls[0].rfind('/') + 1:]
                client = pysvn.Client()
                client.export("http://svn.webkit.org/repository/webkit/trunk/" + urls[0], url + "/../merge/files/" + f, revision=pysvn.Revision(pysvn.opt_revision_kind.number,rev))
                createOWBWebKitPatch(url, file)
            except :
                print "error " + "http://svn.webkit.org/repository/webkit/trunk/" + urls[0] + " doesn't exist"
            #createOWBWebKitPatch(url, file)
    logging.debug('createOWBPatch done')

def createOWBWebKitPatch(url, file):
    logging.debug('createOWBWebKitPatch')
    f = file[file.rfind('/') + 1:].strip()
    url = url.strip()
    file = file.strip()

    os.system("diff -Naur " + url + "/../merge/files/" + f + " " + url + "/" + file + " > " + url + "/../merge/patches/" + f + ".patch")
    patch = open(url + "/../merge/patches/" + f + ".patch", 'r')
    content = patch.read()
    patch.close()
    content = content.replace("---", "Index: " + file +"\n===================================================================\n---", 1)
    content = content.replace("--- " + url + "/../merge/files/" + f, "--- " + file, 1)
    content = content.replace("+++ " + url + "/" + file, "+++ " + file, 1)
    patch = open(url + "/../merge/patches/" + f + ".patch", 'w')
    patch.write(content)
    patch.close()

    shutil.copyfile(url + "/../merge/files/" + f, url + "/" + file)
    logging.debug('createOWBWebKitPatch done')

def createOWBBALPatch(url, src, dest) :
    logging.debug('createOWBBALPatch')
    p = dest[dest.rfind('/') + 1:].strip()
    url = url.strip()
    src = src.strip()
    dest = dest.strip()

    os.system("diff -Naur " + url + "/" + src + " " + url + "/" + dest + " > " + url + "/../merge/patches/bal/" + p + ".patch")

    patch = open(url + "/../merge/patches/bal/" + p + ".patch", 'r')
    content = patch.read()
    patch.close()
    content = content.replace("---", "Index: " + dest +"\n===================================================================\n---")
    content = content.replace("--- " + url + "/" + src, "--- " + dest)
    content = content.replace("+++ " + url + "/" + dest, "+++ " + dest)
    patch = open(url + "/../merge/patches/bal/" + p + ".patch", 'w')
    patch.write(content)
    patch.close()

    shutil.copyfile(url + "/" + src, url + "/" + dest)
    logging.debug('createOWBBALPatch done')



def createWebkitPatch(path, lastMergeVersion, currentMergeVersion) :
    logging.debug('create webKit patch rev last merge ' + str(lastMergeVersion) + ' rev current merge ' + str(currentMergeVersion) )
    client = pysvn.Client()

    dir = ["Source/WebCore", "Source/JavaScriptCore", "Source/WebKit", "Source/WTF", "Tools"]
    for d in dir :
        logging.debug('create patch for ' + d)
        patch = open(path + "/../webkit-" + str(currentMergeVersion) + "-" + d[d.rfind('/') + 1:] + ".patch", 'r')
        diff_text = patch.read()
        diff_text = renameHeaderPatch(diff_text, d)
        patch.close()
        file = open(path + "/../merge/webkit-" + str(currentMergeVersion) + "-" + d[d.rfind('/') + 1:] + ".patch", 'w')
        file.write(diff_text)
        file.close()
#        if d == "JavaScriptCore" :
#            diff_text = client.diff("/tmp/", "http://svn.webkit.org/repository/webkit/trunk/" + d, revision1=pysvn.Revision(pysvn.opt_revision_kind.number, lastMergeVersion), revision2=pysvn.Revision(pysvn.opt_revision_kind.number, currentMergeVersion))
#        elif d == "WebCore" :
#            diff_text = client.diff("/tmp/", "http://svn.webkit.org/repository/webkit/trunk/" + d, revision1=pysvn.Revision(pysvn.opt_revision_kind.number, lastMergeVersion), revision2=pysvn.Revision(pysvn.opt_revision_kind.number, currentMergeVersion))
#        elif d == "WebKit" :
#            diff_text = client.diff("/tmp/", "http://svn.webkit.org/repository/webkit/trunk/" + d, revision1=pysvn.Revision(pysvn.opt_revision_kind.number, lastMergeVersion), revision2=pysvn.Revision(pysvn.opt_revision_kind.number, currentMergeVersion))
#        else :
#            diff_text = client.diff("/tmp/", "http://svn.webkit.org/repository/webkit/trunk/" + d, revision1=pysvn.Revision(pysvn.opt_revision_kind.number, lastMergeVersion), revision2=pysvn.Revision(pysvn.opt_revision_kind.number, currentMergeVersion))
#        diff_text = renameHeaderPatch(diff_text, d)
#        file = open(path + "/../merge/webkit-" + str(currentMergeVersion) + "-" + d[d.rfind('/') + 1:] + ".patch", 'w')
#        file.write(diff_text)
#        file.close() 
    logging.debug('create webKit patch done')

def renameHeaderPatch(content, name) :
    file = content.replace("Index: ", "Index: " + name + "/")
    file = file.replace("--- ", "--- " + name + "/")
    file = file.replace("+++ ", "+++ " + name + "/")
    #fix for mac
    file = file.replace("r'evision", "revision")
    return file

    

def applyWebkitPatch(path, currentMergeVersion) :
    logging.debug('apply webkit patch')
    change = False
    if path != os.getcwd() :
        current = os.getcwd()
        os.chdir(path)
	change = True
    
    dir = ["WebCore", "JavaScriptCore", "WebKit", "WTF", "Tools"]
    for d in dir :
        logging.debug('apply ' + path + "/../merge/webkit-" + str(currentMergeVersion) + "-" + d + ".patch") 
        os.system(path + "/Tools/Scripts/svn-apply --force " + path + "/../merge/webkit-" + str(currentMergeVersion) + "-" + d + ".patch")
    if change :
        os.chdir(current)
    logging.debug('apply webkit patch done')


def applyOWBPatch(path) :
    logging.debug('apply owb patch')
    change = False
    if path != os.getcwd() :
        current = os.getcwd()
        os.chdir(path)
        change = True
    #WebKit patch
    list = os.listdir(path + "/../merge/patches")
    for file in list : 
        if file != 'bal' :
	    logging.debug('apply webkit patch : ' + path + "/../merge/patches/" + file)
            os.system(path + "/Tools/Scripts/svn-apply --force " + path + "/../merge/patches/" + file)

    #BAL patch
    list = os.listdir(path + "/../merge/patches/bal")
    for file in list : 
	logging.debug('apply webkit patch : ' + path + "/../merge/patches/bal/" + file)
        os.system(path + "/Tools/Scripts/svn-apply --force " + path + "/../merge/patches/bal/" + file)
    if change :
        os.chdir(current)
    logging.debug('apply owb patch done')

