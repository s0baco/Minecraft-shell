#!/bin/sh
SESSION_NAME="minecraft"

screen -S $SESSION_NAME -p 0 -X eval 'stuff "say SERVER STOP IN 30 SECONDS.\015"'
screen -S $SESSION_NAME -p 0 -X eval 'stuff "save-all\015"'
sleep 10
screen -S $SESSION_NAME -p 0 -X eval 'stuff "stop\015"'

