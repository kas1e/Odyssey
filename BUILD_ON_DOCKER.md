To create the container you can use the following command at your terminal

```bash
docker run -it --rm --name odysseyondocker -v "$PWD"/code:/opt/code -w /opt/code -e ODYSSEY_INC="/opt/code/Odyssey/odyssey-r155188-1.23_SDK/SDK" walkero/odysseyondocker:latest /bin/bash
```
With the above command you will be inside the container, in the folder `/opt/code`. Now you need to clone the repo and build Odyssey

```bash
git clone https://github.com/walkero-gr/Odyssey.git
cd /opt/code/Odyssey/odyssey-r155188-1.23/
mkdir build
cd build
cmake .. \
    -DCMAKE_CROSSCOMPILING=ON \
    -DCMAKE_TOOLCHAIN_FILE=./amigaos4.cmake \
    -DCMAKE_MODULE_PATH=../cmake \
    -DUSE_GRAPHICS="MORPHOS" \
    -DUSE_FONTS="FREETYPE" \
    -DUSE_TIMER="MORPHOS" \
    -DBUILD_SHARED_LIBS="NO" \
    -DUSE_THREADS="MORPHOS" \
    -DWITH_OWB_CONFIG_DIR="PROGDIR:owb.conf" \
    -DENABLE_MULTIPLE_THREADS=OFF \
    -DENABLE_ACCESSIBILITY:BOOL=ON \
    -DENABLE_BLOB:BOOL=ON \
    -DENABLE_DATALIST:BOOL=ON \
    -DENABLE_DOM_STORAGE:BOOL=ON \
    -DENABLE_EVENTSOURCE:BOOL=ON \
    -DENABLE_FILE_SYSTEM:BOOL=ON \
    -DENABLE_FILTERS:BOOL=ON \
    -DENABLE_ICONDATABASE:BOOL=ON \
    -DENABLE_INSPECTOR:BOOL=ON \
    -DENABLE_JIT_JSC:BOOL=OFF \
    -DENABLE_MATHML:BOOL=ON \
    -DENABLE_MEDIA_STATISTICS:BOOL=ON \
    -DENABLE_METER_TAG:BOOL=ON \
    -DENABLE_NOTIFICATIONS:BOOL=ON \
    -DENABLE_NPAPI:BOOL=ON \
    -DENABLE_OFFLINE_DYNAMIC_ENTRIES:BOOL=ON \
    -DENABLE_OFFLINE_WEB_APPLICATIONS:BOOL=ON \
    -DENABLE_PROGRESS_TAG:BOOL=ON \
    -DENABLE_REQUEST_ANIMATION_FRAME:BOOL=ON \
    -DENABLE_RUBY:BOOL=ON \
    -DENABLE_SANDBOX:BOOL=ON \
    -DENABLE_SQL_DATABASE:BOOL=ON \
    -DENABLE_SVG:BOOL=ON \
    -DENABLE_SVG_ANIMATION:BOOL=ON \
    -DENABLE_SVG_AS_IMAGE:BOOL=ON \
    -DENABLE_SVG_FONTS:BOOL=ON \
    -DENABLE_SVG_FOREIGN_OBJECT:BOOL=ON \
    -DENABLE_SVG_USE_ELEMENT:BOOL=ON \
    -DENABLE_WEB_SOCKETS:BOOL=ON \
    -DENABLE_WEB_TIMING:BOOL=ON \
    -DENABLE_XPATH:BOOL=ON \
    -DENABLE_XSLT:BOOL=ON \
    -DENABLE_TESTS:BOOL=OFF \
    -DENABLE_TESTS_CPPUNIT:BOOL=OFF \
    -DENABLE_YARR:BOOL=ON

make Odyssey -j4
```

If in any case you have the following error, disable the `#include "BCRefPtrWTF.h` at the file `odyssey-r155188-1.23\BAL\Types\WTF\BCPlatformRefPtrWTF.h`
```
    [ 30%] Building CXX object Source/WebCore/CMakeFiles/webcore.dir/__/__/BAL/Graphics/WebCore/Cairo/BCPlatformPathCairo.cpp.obj
    [ 30%] Building CXX object Source/WebCore/CMakeFiles/webcore.dir/__/__/BAL/Graphics/WebCore/Cairo/BCPlatformPathCairoCairo.cpp.obj
    [ 30%] Building CXX object Source/WebCore/CMakeFiles/webcore.dir/__/__/BAL/Graphics/WebCore/Cairo/BCPlatformRefPtrCairoCairo.cpp.obj
    [ 30%] Building CXX object Source/WebCore/CMakeFiles/webcore.dir/__/__/BAL/Graphics/WebCore/Cairo/BCRefPtrCairoCairo.cpp.obj
    In file included from /opt/code/Odyssey/odyssey-r155188-1.23/build/generated_link/BAL/PlatformRefPtrCairo.h:23,
                     from /opt/code/Odyssey/odyssey-r155188-1.23/BAL/Graphics/WebCore/Cairo/BCPlatformRefPtrCairoCairo.cpp:20:
    /opt/code/Odyssey/odyssey-r155188-1.23/build/generated_link/BAL/wtf/PlatformRefPtr.h:29:10: fatal error: BCRefPtrWTF.h: No such file or directory
     #include "BCRefPtrWTF.h"
              ^~~~~~~~~~~~~~~
    compilation terminated.
    Source/WebCore/CMakeFiles/webcore.dir/build.make:14061: recipe for target 'Source/WebCore/CMakeFiles/webcore.dir/__/__/BAL/Graphics/WebCore/Cairo/BCPlatformRefPtrCairoCairo.cpp.obj' failed
    make[3]: *** [Source/WebCore/CMakeFiles/webcore.dir/__/__/BAL/Graphics/WebCore/Cairo/BCPlatformRefPtrCairoCairo.cpp.obj] Error 1
    make[3]: *** Waiting for unfinished jobs....
    CMakeFiles/Makefile2:302: recipe for target 'Source/WebCore/CMakeFiles/webcore.dir/all' failed
    make[2]: *** [Source/WebCore/CMakeFiles/webcore.dir/all] Error 2
    CMakeFiles/Makefile2:424: recipe for target 'Tools/OWBLauncher/CMakeFiles/Odyssey.dir/rule' failed
    make[1]: *** [Tools/OWBLauncher/CMakeFiles/Odyssey.dir/rule] Error 2
    Makefile:277: recipe for target 'Odyssey' failed
    make: *** [Odyssey] Error 2
```