#!/usr/bin/env bash
cat /var/lib/postgresql/data/postgresql.conf | grep syslog
exit

f=/var/lib/postgresql/data/postgresql.conf; cat $f | grep -E "log_destination|syslog_facility|syslog_ident|log_min_messages"
if [ ! -f $f.old ]; then cat $f | grep -vE "log_destination|syslog_facility|syslog_ident|log_min_messages" >$f.old; fi
cp $f.old $f
echo "log_destination = 'syslog'" >> $f
echo "syslog_facility = 'LOCAL5'" >> $f
echo "syslog_ident = 'postgres'" >> $f
echo "log_min_messages = notice" >> $f   #  DEBUG5, DEBUG4, DEBUG3, DEBUG2, DEBUG1, INFO, NOTICE, WARNING, ERROR, LOG, FATAL, and PANIC
reboot

# RAISE NOTICE 'private_update_card_id(d=%)', to_json(d));
journalctl -t pg_ctl -t postgres -p notice -f
