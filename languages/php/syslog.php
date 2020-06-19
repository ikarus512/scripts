<?php

function _log($text, $var = null) {
    openlog("myphp", LOG_PID | LOG_PERROR, LOG_LOCAL5);
    syslog(LOG_ERR, $text . print_r($var, TRUE));  // LOG_EMERG LOG_ALERT LOG_CRIT LOG_ERR LOG_WARNING LOG_NOTICE LOG_INFO LOG_DEBUG
    closelog();
}

// syslog(LOG_WARNING, "Warn: {$_SERVER['REMOTE_ADDR']} ({$_SERVER['HTTP_USER_AGENT']})");
_log('');
