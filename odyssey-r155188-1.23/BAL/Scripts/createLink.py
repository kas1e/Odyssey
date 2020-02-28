#!/usr/bin/python

import os
import re
import sys

def appendSlash(dir):
    if dir[len(dir) - 1] != '/' :
        dir += '/'
    return dir

if len(sys.argv) != 3 :
    print 'usage: create_include_link.py src_dir dst_dir'
    quit()

directory = appendSlash(sys.argv[1])
generated_link = appendSlash(sys.argv[2])

#Create generated link directories
if not os.path.exists(generated_link) :
    os.makedirs(generated_link, 0755)

#retrieve all headers from directory
#and store them in headerList
content = os.listdir(directory)
headerPattern = re.compile('\w*\.h$')
headerList = list()
for item in content :
    header = headerPattern.search(item)
    if header is not None :
        headerList.append(header.group())

#read file exception.txt in directory
#and store result in exceptionList
exception = directory + 'exceptions.txt'
exceptionList = list()
if os.path.exists(exception) and os.path.isfile(exception) :
    f = open(exception, 'r')
    exceptionContent = f.readlines()
    f.close()
    for item in exceptionContent :
        exceptionList.append(item.split())

#remove headerList item already present in exceptionList
#also remove single element in exceptionList as they do not
#require a symlink to be done
if len(exceptionList) > 0 :
    idxList = list()
    for item in exceptionList :
        filePattern = re.compile('^' + item[0] + '$')
        for parse in headerList :
            match = filePattern.search(parse)
            if match is not None :
                headerList.remove(match.group())
                break
        if len(item) < 2 :
            idxList.append(exceptionList.index(item))
    if len(idxList) > 0 :
        idxList.reverse()
        for idx in idxList :
            del exceptionList[idx]

#create symlink for exceptionList and headerList
if len(exceptionList) > 0 :
    for item in exceptionList :
        if os.path.islink(generated_link + item[1]) :
            os.unlink(generated_link + item[1])
        os.symlink(directory + item[0], generated_link + item[1])

if len(headerList) > 0 :
    split = directory.rsplit('/', 2)
    suffix = split[len(split) - 2]
    for item in headerList :
        dst = re.sub(suffix + '\.h$', '.h', re.sub('^BC', '', item))
        if os.path.islink(generated_link + dst) :
            os.unlink(generated_link + dst)
	#print "createlink <%s> <%s>" % (directory + item, generated_link + dst) 
        os.symlink(directory + item, generated_link + dst)

