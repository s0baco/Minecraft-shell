#!/bin/sh

. ./minecraft.conf

screen -S $SESSION_NAME -p 0 -X eval 'stuff "say $HEADER SERVER STOPPING...\015"'

screen -S $SESSION_NAME -p 0 -X eval 'stuff "save-all\015"'
screen -S $SESSION_NAME -p 0 -X eval 'stuff "say $HEADER WORLD SAVING...\015"'

screen -S $SESSION_NAME -p 0 -X eval 'stuff "stop\015"'
echo "Done."

