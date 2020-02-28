import logging
import os
import shutil

def configureSDL(path):
    logging.debug('configure build for SDL')
    if os.path.exists(path + "/build_merge_sdl") :
        shutil.rmtree(path + "/build_merge_sdl")
    os.mkdir(path + "/build_merge_sdl")
    current = os.getcwd()
    os.chdir(path + "/build_merge_sdl")
    os.system("cmake -C " + path + "/cmake/ConfigureBuildSDL.cmake ..")
    os.chdir(current)
    logging.debug('configure build for SDL done, you can compile WebKit-owb SDL in ' + path + "/build_merge_sdl")
    print 'configure build for SDL done, you can compile WebKit-owb SDL in ' + path + "/build_merge_sdl"

def configureGtk(path):
    logging.debug('configure build for Gtk')
    if os.path.exists(path + "/build_merge_gtk") :
        shutil.rmtree(path + "/build_merge_gtk")
    os.mkdir(path + "/build_merge_gtk")
    current = os.getcwd()
    os.chdir(path + "/build_merge_gtk")
    os.system("cmake -C " + path + "/cmake/ConfigureBuildGtk.cmake ..")
    os.chdir(current)
    logging.debug('configure build for Gtk done, you can compile WebKit-owb Gtk in ' + path + "/build_merge_gtk")
    print 'configure build for Gtk done, you can compile WebKit-owb Gtk in ' + path + "/build_merge_gtk"

def configureSDLMini(path):
    logging.debug('configure build for SDL Mini')
    if os.path.exists(path + "/build_merge_sdl_mini") :
        shutil.rmtree(path + "/build_merge_sdl_mini")
    os.mkdir(path + "/build_merge_sdl_mini")
    current = os.getcwd()
    os.chdir(path + "/build_merge_sdl_mini")
    os.system("cmake -C " + path + "/cmake/ConfigureBuildSDLMini.cmake ..")
    os.chdir(current)
    logging.debug('configure build for SDL mini done, you can compile WebKit-owb SDL mini in ' + path + "/build_merge_sdl_mini")
    print 'configure build for SDL mini done, you can compile WebKit-owb SDL mini in ' + path + "/build_merge_sdl_mini"

def configureQt(path):
    logging.debug('configure build for Qt')
    if os.path.exists(path + "/build_merge_qt") :
        shutil.rmtree(path + "/build_merge_qt")
    os.mkdir(path + "/build_merge_qt")
    current = os.getcwd()
    os.chdir(path + "/build_merge_qt")
    os.system("cmake -C " + path + "/cmake/ConfigureBuildQt.cmake ..")
    os.chdir(current)
    logging.debug('configure build for qt done, you can compile WebKit-owb qt in ' + path + "/build_merge_qt")
    print 'configure build for qt done, you can compile WebKit-owb qt in ' + path + "/build_merge_qt"
