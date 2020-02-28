import pysvn
import logging

def getListAdded(path) :
    logging.debug('list file added')
    print "files added :"
    client = pysvn.Client()
    changes = client.status(path)
    for f in changes :
         if f.text_status == pysvn.wc_status_kind.added :
	     logging.debug(f.path)
	     print f.path
    logging.debug('list file added done')

def getListDeleted(path) :
    print "files deleted :"
    logging.debug('list file deleted')
    client = pysvn.Client()
    changes = client.status(path)
    for f in changes :
         if f.text_status == pysvn.wc_status_kind.deleted :
	     print f.path
	     logging.debug(f.path)
    logging.debug('list file deleted done')

def getWinApiChange(path) :
    print "diff in win api : "
    logging.debug('diff webkit win')
    client = pysvn.Client()
    diff_text = client.diff("/tmp/", path + "/WebKit/win")
    print diff_text
    logging.debug(diff_text)
    logging.debug('diff webkit win done')
