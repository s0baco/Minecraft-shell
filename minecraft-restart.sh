#!/bin/sh

. ./minecraft.conf

screen -S $SESSION_NAME -p 0 -X eval 'stuff "say $HEADER SERVER RESTERT...\015"'

./minecraft-stop.sh
./minecraft-start.sh

# cron-restart
/etc/rc.d/init.d/crond restart
