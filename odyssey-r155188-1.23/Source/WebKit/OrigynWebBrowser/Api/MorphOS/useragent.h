#include "WebKitVersion.h"

// ua_status flags
#define UA_BUILTIN 0x01 // can't be deleted
#define UA_DEFAULT 0x02 // default user-agent string to use in OWB
#define UA_SHOW    0x04 // show entry in spoofing cycle gadget

#define xstringify(s) stringify(s)
#define stringify(s) #s
#define WEBKITVER xstringify(WEBKIT_MAJOR_VERSION) "." xstringify(WEBKIT_MINOR_VERSION)

// Limit user-agents in menu and in listview
#define UA_MAX_INMENU 32
#define UA_MAX_INLIST 64
