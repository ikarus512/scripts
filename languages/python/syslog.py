#!/usr/bin/env python3
import traceback
import json
import syslog

syslog.openlog(ident = "identifier", facility = syslog.LOG_LOCAL5)
d={"a":1}
d=dict(a=1)
syslog.syslog("inside function(d=%s)" % json.dumps(d))

try:
    a = 1 / 0
except Exception as error:
    syslog.syslog(str(traceback.format_exc(1)))
    pass
