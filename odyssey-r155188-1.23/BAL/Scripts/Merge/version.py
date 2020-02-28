import os
import pysvn
import logging

def getVersionLastMerge(path) :
    logging.debug('get version last merge')
    file = open(path + "/lastMerge.txt", 'r')
    rev = file.read()
    file.close()
    logging.debug('get version last merge done, revision = ' + str(rev))
    return rev

def getVersionCurrentMerge():
    logging.debug('get version current merge')
    client = pysvn.Client()
    rev = client.info2("http://svn.webkit.org/repository/webkit/trunk", recurse=False)[0][1]["rev"]
    revision = getattr(rev, "number")
    logging.debug('get version current merge done, revision = ' + str(revision))
    return revision

def registerCurrentVersion(path, version):
    logging.debug('register current version')
    file = open(path + "/lastMerge.txt", 'w')
    file.write(str(version))
    file.close()
    logging.debug('register current version done')
