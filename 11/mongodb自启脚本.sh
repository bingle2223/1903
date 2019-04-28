#!/bin/sh

### BEGIN INIT INFO
# Provides:     mongodb
# Required-Start:
# Required-Stop:
# Default-Start:        2 3 4 5
# Default-Stop:         0 1 6
# Short-Description: mongodb
# Description: mongo db server
### END INIT INFO

. /lib/lsb/init-functions

PROGRAM=/usr/local/mongodb/bin/mongod
MONGOPID=`ps -ef | grep 'mongod' | grep -v grep | awk '{print $2}'`

test -x $PROGRAM || exit 0
case "$1" in
  start)
     log_begin_msg "Starting MongoDB server"
     $PROGRAM -f /etc/mongod.conf
     log_end_msg 0
     ;;
  stop)
     log_begin_msg "Stopping MongoDB server"
     if [ ! -z "$MONGOPID" ]; then
        kill -15 $MONGOPID
     fi
     log_end_msg 0
     ;;
  status)
     ;;
  *)
     log_success_msg "Usage: /etc/init.d/mongodb {start|stop|status}"
     exit 1
esac
exit 0