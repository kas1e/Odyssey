#!/usr/bin/python

from parser import ParseDrtOptions
from runtests import RunTests
from testsList import TestsList
import logging
import os
import pysvn
import sys

usage = 'drt -d DIRECTORY -l DIRECTORY -p PLATFORM -s DIRECTORY [extra-options] [directories]'
feature_list = ['3d', 'accessibility', 'appcache', 'cehtml', 'dae', 'dae_download',
                'dae_metadata', 'dae_permission', 'dae_pvr', 'dae_tuner', 'datagrid', 'domstorage', 'eventsource', 
                'geolocation', 'hbbtv_0_8', 'http', 'inspector', 'mathml', 'media', 'notifications', 
                'plugin', 'sharedworkers', 'storage', 'svg', 'wcss', 'webgl', 'websocket', 
                'wml', 'workers', 'xhtmlmp', 'xpath', 'xslt']

#for each feature, the list of the path from LayoutTests directory available.
ignoredDirectories = {'3d' : ['compositing', 'animations/3d', 'transforms/3d'],
                      'accessibility' : ['accessibility'],
                      'appcache' : ['http/tests/appcache'],
                      'cehtml' : ['cehtml'],
                      'dae' : ['applications'],
                      'dae_download' : ['applications/download'],
                      'dae_metadata' : ['applications/metadata'],
                      'dae_permission' : ['applications/permission'],
                      'dae_pvr' : ['applications/pvr'],
                      'dae_tuner' : ['applications/tuner'],
                      'datagrid' : ['fast/dom/HTMLDataGridElement'],
                      'domstorage' : ['storage/domstorage'],
                      'eventsource' : ['fast/eventsource', 'http/tests/eventsource'],
                      'geolocation' : ['fast/dom/Geolocation'],
                      'hbbtv_0_8' : ['applications/hbbtv_0_8'],
                      'http' : ['http'],
                      'inspector' : ['inspector', 'fast/inspector'],
                      'mathml' : ['mathml'],
                      'media' : ['media', 'http/tests/media'],
                      'notifications' : ['fast/notifications'],
                      'plugin' : ['plugins', 'http/tests/plugins'],
                      'sharedworkers' : ['fast/workers/shared', 'http/tests/xmlhttprequest/workers/shared', 'http/tests/workers/shared'],
                      'storage' : ['storage'],
                      'svg' : ['svg', 'dom/svg'],
                      'wcss' : ['fast/wcss'],
                      'webgl' : ['fast/canvas/webgl'],
                      'websocket' : ['websocket', 'fast/websockets'],
                      'wml' : ['wml', 'fast/wml', 'http/tests/wml'],
                      'workers' : ['fast/workers', 'http/tests/xmlhttprequest/workers', 'http/tests/workers'],
                      'xhtmlmp' : ['fast/xhtmlmp'],
                      'xpath' : ['fast/xpath', 'dom/svg/level3/xpath'],
                      'xslt' : ['fast/xsl']}

supportedFileExtensions = {'cehtml' : '.cehtml', 'svg' : '.svg', 'wml' : '.wml'}

cmakeOptionWrapper = {'ENABLE_3D_RENDERING' : '3d',
                      'ENABLE_ACCESSIBILITY' : 'accessibility', 
                      'ENABLE_OFFLINE_WEB_APPLICATIONS' : 'appcache',
                      'ENABLE_CEHTML' : 'cehtml',
                      'ENABLE_DAE' : 'dae',
                      'ENABLE_DAE_DOWNLOAD' : 'dae_download',
                      'ENABLE_DAE_METADATA' : 'dae_metadata',
                      'ENABLE_DAE_PERMISSION' : 'dae_permission',
                      'ENABLE_DAE_PVR' : 'dae_pvr',
                      'ENABLE_DAE_TUNER' : 'dae_tuner',
                      'ENABLE_DATAGRID' : 'datagrid',
                      'ENABLE_DOM_STORAGE' : 'domstorage',
                      'ENABLE_EVENTSOURCE' : 'eventsource',
                      'ENABLE_GEOLOCATION' : 'geolocation',
                      'ENABLE_HBBTV_0_8' : 'hbbtv_0_8',
                      'ENABLE_INSPECTOR' : 'inspector',
                      'ENABLE_MATHML' : 'mathml',
                      'ENABLE_VIDEO' : 'media',
                      'ENABLE_NOTIFICATIONS' : 'notifications',
                      'ENABLE_NPAPI' : 'plugin',
                      'ENABLE_SHARED_WORKERS' : 'sharedworkers',
                      'ENABLE_DATABASE' : 'storage',
                      'ENABLE_SVG' : 'svg',
                      'ENABLE_WCSS' : 'wcss',
                      'ENABLE_3D_CANVAS' : 'webgl',
                      'ENABLE_WEB_SOCKETS' : 'websocket',
                      'ENABLE_WML' : 'wml',
                      'ENABLE_WORKERS' : 'workers',
                      'ENABLE_XHTMLMP' : 'xhtmlmp',
                      'ENABLE_XPATH' : 'xpath',
                      'ENABLE_XSLT' : 'xslt'}

webkit_layout_tests = 'http://svn.webkit.org/repository/webkit/trunk/LayoutTests'

def update_tests():
    svn = pysvn.Client()
    try:
        info = svn.info(config['layout'])
    except pysvn.ClientError, e:
        print str(e)
        print 'to fix: svn checkout ' + webkit_layout_tests + ' ' + config['layout']
        exit(1)
    if info.url == webkit_layout_tests:
        if config['revision']:
            number = config['revision']
        else:
            print 'to update ' + config['layout'] + ' directory, you need to specify revision'
            exit(1)
        revision = pysvn.Revision(pysvn.opt_revision_kind.number, number)
        if info.revision != revision:
            svn.update(config['layout'], revision = revision)
    else:
        svn.update(config['layout'])

drt_options = ParseDrtOptions(usage, feature_list, cmakeOptionWrapper)
drt_options.initialize_options()
(options, args) = drt_options.parse_args()

# convert options to dictionary
config = options.__dict__

logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s %(levelname)s %(message)s',
                    filename='/tmp/drt.log',
                    filemode='w')

if config['update']:
    update_tests()

li = []
List = TestsList(config)
List.constructList(feature_list, ignoredDirectories, supportedFileExtensions)
if len(args) == 0 :
    li = List.createList()
else :
    for path in args:
        if os.path.isdir(path) :
            for l in List.createList(path) :
                li.append(l)
        else :
            path = List.changePathIfNeeded(path)
            li.append(path)

run = RunTests(config, li)
run.startDrt()
