#!/usr/bin/env python

import os

cmakeModulePath = ''
for root, directories, files in os.walk(os.getcwd()):
    for directory in directories:
        if 'cmake' in directory:
            cmakeModulePath += os.path.join(root, directory)
            cmakeModulePath += ';'
print cmakeModulePath
