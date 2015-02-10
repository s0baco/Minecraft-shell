#!/bin/sh

. ./minecraft.conf

screen -S ${SESSION_NAME} -p 0 -X eval 'stuff "say SERVER STOPPING...\015"'
screen -S ${SESSION_NAME} -p 0 -X eval 'stuff "save-all\015"'

if [$1 != "-nowait" -o $1 != "nowait"];then
	sleep ${WAIT}
fi
screen -S ${SESSION_NAME} -p 0 -X eval 'stuff "stop\015"'

