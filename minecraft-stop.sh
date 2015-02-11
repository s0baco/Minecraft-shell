#!/bin/sh

. ./minecraft.conf

screen -S $SESSION_NAME -p 0 -X eval 'stuff "say $HEADER SERVER STOPPING...\015"'

i=0
while [ "$i" -le "$WAIT" ]
do
	h=$WAIT-$i
	screen -S $SESSION_NAME -p 0 -X eval 'stuff "say $HEADER $h...\015"'
	echo "$h..."
	sleep 1
done

screen -S $SESSION_NAME -p 0 -X eval 'stuff "save-all\015"'
screen -S $SESSION_NAME -p 0 -X eval 'stuff "say $HEADER WORLD SAVING...\015"'

screen -S $SESSION_NAME -p 0 -X eval 'stuff "stop\015"'
echo "Done."

