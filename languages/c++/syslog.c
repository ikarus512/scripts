#include <syslog.h>
openlog("appname", LOG_PID | LOG_NDELAY, LOG_LOCAL5);
syslog(LOG_WARNING, "%s %s(%d): Message %s %s", __FILE__, __FUNCTION__, __LINE__, "msg1", std_string.c_str());
