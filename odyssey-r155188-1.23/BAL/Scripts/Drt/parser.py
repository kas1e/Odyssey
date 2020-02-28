from optparse import OptionParser, OptionValueError
import os

# for more info about this class:
# http://docs.python.org/library/optparse.html

class ParseDrtOptions(OptionParser):
    def __init__(self, usage, feature_list, cmakeOptionWrapper):
        OptionParser.__init__(self, usage)
        self.feature_list = feature_list
        self.cmakeOptionWrapper = cmakeOptionWrapper

    def add_feature(self, feature):
        enable_option = '--enable-' + feature
        disable_option = '--disable-' + feature
        help_enable = 'Enable ' + feature + ' Layout Tests'
        help_disable = 'Disable ' + feature + ' Layout Tests [default]'
        self.add_option(enable_option, action = 'store_true', dest = feature, default = False, help = help_enable)
        self.add_option(disable_option, action = 'store_false', dest = feature, help = help_disable)

    def initialize_options(self):
        for feature in self.feature_list:
            self.add_feature(feature)
        self.add_option('--display-leak', action = 'store_true', dest = 'leak', default = False, help = 'display leak results')
        self.add_option('-c', '--config', action = 'callback', callback = self.__parse_config_file, type = 'string', nargs = 1, dest = 'config', metavar = 'FILE', help = 'config FILE to use')
        self.add_option('-d', '--drt-path', action = 'store', type = 'string', dest = 'drt', metavar = 'PATH', help = 'PATH to DumpRenderTree [mandatory]')
        self.add_option('-l', '--layout-path', action = 'store', type = 'string', dest = 'layout', metavar = 'PATH', help = 'PATH to Layout Tests [mandatory]')
        self.add_option('-o', '--output', action = 'store', type = 'string', dest = 'output', metavar = 'DIRECTORY', default = '/tmp/DrtResult', help = 'DIRECTORY to store results [default = %default]')
        self.add_option('-p', '--platform', action = 'store', type = 'string', dest = 'platform', metavar = 'PLATFORM', help = 'PLATFORM name for Layout Tests [mandatory]')
        self.add_option('-r', '--revision', action = 'callback', callback = self.__revision, type = 'int', nargs = 1, dest = 'revision', metavar = 'REV', help = 'update Layout Tests to revision REV [require -u before]')
        self.add_option('-s', '--source-path', action = 'store', type = 'string', dest = 'source', metavar = 'PATH', help = 'PATH to browser sources [MANDATORY if you enable websocket]')
        self.add_option('-u', '--update-tests', action = 'store_true', dest = 'update', default = False, help = 'update Layout Tests')
        self.add_option('-v', '--verbose', action = 'store_true', dest = 'verbose', help = 'verbose mode')

    def parse_args(self):
        (options, args) = OptionParser.parse_args(self)
        if options.drt is None:
            self.error('missing mandatory --drt-path option')
        if options.layout is None:
            self.error('missing mandatory --layout-path option')
        if options.platform is None:
            self.error('missing mandatory --platform option')
        if options.source is None :
            self.error('missing mandatory --source-path option')
        #strip whitespace...
        options.drt = options.drt.strip()
        options.layout = os.path.abspath(options.layout.strip())
        options.platform = options.platform.strip()
        return (options, args)

    def __parse_config_file(self, option, opt_str, value, parser):
        CmakeFile = open(value, 'r')
        for line in CmakeFile:
            pos = line.find("ENABLE")
            if pos != -1 and line.find("=ON") != -1 :
                colon = line.find(":", pos)
                enable = line[pos:colon]
                if enable in self.cmakeOptionWrapper.keys() :
                    parser.values.__dict__[self.cmakeOptionWrapper[enable]] = True
                elif "ENABLE_DEBUG" in line :
                    parser.values.leak = True
        CmakeFile.close()
        setattr(parser.values, option.dest, value)

    def __revision(self, option, opt_str, value, parser):
        if not parser.values.update:
            raise OptionValueError("can't use %s without -u/--update-tests", opt_str)
        setattr(parser.values, option.dest, value)
