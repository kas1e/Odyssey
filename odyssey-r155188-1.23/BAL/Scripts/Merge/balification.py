import os
import shutil 
import logging

def balify(path):
    logging.debug('balify')
    files = open(path + "/BAL/Scripts/data/balInputList.txt")
    for f in files :
        if len(f.strip()) != 0 and f.find("#") == -1 and f.find("Skeletons") == -1 :
            fileTab = f.split()
            name = ""
            if len(fileTab) == 3 :
                name = fileTab[0] + '/' + fileTab[2]
            else :
  	            name = balifyName(fileTab[0], fileTab[1])
            logging.debug('copy file ' + fileTab[1] + ' to ' + name)
            if os.path.exists(fileTab[1]) : 
    	        shutil.copyfile(fileTab[1], name)
            else :
                logging.warning('file ' + fileTab[1] + ' has been deleted')
                logging.warning('Do not forget to remove ' + name + ' from BAL')
                logging.warning('and ' + fileTab[1] + ' from BalInputList.txt')

    logging.debug('balify done')
    files.close()

def balifyName(destDir, pathOrig) : 
    logging.debug('balify name')
    dest = destDir[destDir.rfind('/') + 1 : ]
    file = pathOrig[pathOrig.rfind('/') + 1 : ]
    logging.debug('dest = ' + dest)
    logging.debug('file = ' + file)

    n = ""
    if file.find(dest + ".") == -1 :
	logging.debug('extension not found')
        n = destDir + '/BC' + file[:file.rfind('.')] + dest + file[file.rfind('.'):]
    else :
        n = destDir + '/BC' + file
    logging.debug('balify done, origin file is ' + file + ' and the name return is ' + n)
    return n
