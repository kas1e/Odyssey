import pysvn
import os
import logging

def clean(path) :
    logging.debug('clean owb') 
    cleanMergeDirectory(path)
#    if createPatch(path):
#        revertChange(path)
    update(path)



def removeall(path) :
    if not os.path.isdir(path):
        return
    
    files=os.listdir(path)

    for x in files:
        fullpath=os.path.join(path, x)
        if os.path.isfile(fullpath):
            os.remove(fullpath)
        elif os.path.isdir(fullpath):
            removeall(fullpath)
            os.rmdir(fullpath)

def cleanMergeDirectory(path) :
    logging.debug('clean merge directory')
    if not os.path.exists(path + "/../merge") :
        os.mkdir(path + "/../merge")
    else :
        removeall(path + "/../merge")
    logging.debug('clean merge directory done')


def createPatch(path) :
    logging.debug('create patch for the working directory')
    client = pysvn.Client()
    diff_text = client.diff("/tmp/", path)
    if len(diff_text) != 0 :
        rev = client.info2(path, recurse=False)[0][1]["rev"]
	revision =  getattr(rev, "number")
        file = open(path + "/../merge/work-" + str(revision) + ".patch", 'w')
        file.write(diff_text)
	file.close()
	logging.debug('create patch done, a patch are created')
	return True
    else:
        logging.debug('create patch done, no patch created')
        return False

def revertChange(path):
    logging.debug('revert all change')
#    client = pysvn.Client()
#    client.revert(path, True)
#    logging.debug('revert all change done')
    logging.debug('skipping')

def update(path):
    logging.debug('update the working directory')
#    client = pysvn.Client()
#    client.update(path)
#    logging.debug('update done')
    logging.debug('skipping')
