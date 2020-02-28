import logging
import os

def checkDataIntegrity(path) :
    status = True
    logging.debug('check balInputList.txt')
    print'check balInputList.txt'
    f = open(path + "/BAL/Scripts/data/balInputList.txt", "r")
    for fi in f :
        if fi.strip() != '' and fi.find('#') == -1 :
            fiTab = fi.split()
            file = fiTab[1]
            if not os.path.exists(file) :
                status = False
                print file + " not exists"
    f.close()

    logging.debug('check balInputList.txt done')
    print 'check balInputList.txt done'
    logging.debug('check WebKitFiles.txt')
    print 'check WebKitFiles.txt'
    f = open(path + "/BAL/Scripts/data/WebKitFiles.txt", "r")
    for fi in f :
        if fi.strip() != '' and fi.find('#') == -1 :
            fiTab = fi.split()
            for file in fiTab :
                if not os.path.exists(file) :
                   status = False
                   print file + " not exists"
    f.close()
    logging.debug('check WebKitFiles.txt done')
    print 'check WebKitFiles.txt done'
    return status
