#!/usr/bin/env bash
cat /var/lib/postgresql/data/postgresql.conf | grep syslog
exit

f=/var/lib/postgresql/data/postgresql.conf; cat $f | grep -P "log_destination|syslog_facility|syslog_ident|log_min_messages"
echo "log_destination = 'syslog'" >> $f
echo "syslog_facility = 'LOCAL5'" >> $f
echo "syslog_ident = 'postgres'" >> $f
echo "log_min_messages = notice" >> $f   #  DEBUG5, DEBUG4, DEBUG3, DEBUG2, DEBUG1, INFO, NOTICE, WARNING, ERROR, LOG, FATAL, and PANIC
#syslog_sequence_numbers = on
#syslog_split_messages = on



journalctl -t pgsql -t postgres -f
