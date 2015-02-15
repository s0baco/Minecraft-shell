#!/bin/bash

source ./minecraft.conf

# This function is send command to Minecraft session on screen
# ex. send_cmd "say Hello"
function send_cmd {
  screen -S $SESSION_NAME -p 0 -X eval $1
}

function kill_minecraft {
  send_cmd 'stuff "save-all\015"'
  send_cmd 'stuff "say $HEADER WORLD SAVING...\015"'
  send_cmd 'stuff "stop\015"'
}

function start_minecraft {
    screen -AmdS $SESSION_NAME java -Xmx${JVM_RAM_MAX}M -Xms${JVM_RAM_MIN}M $JVM_OPTION -jar $SERVER_NAME.jar nogui
}

function stop_minecraft {
  send_cmd 'stuff "say $HEADER SERVER STOPPING...\015"'
  i=$WAIT
  while [[ $i != 0 ]]; do
    echo "$i..."
    send_cmd 'stuff "say $HEADER $i...\015"'
    $i = $(( $i - 1 ))
    sleep 1
  done
  echo "0"

  kill_minecraft

  echo "Done."
}

function backup_minecraft {
  send_cmd 'stuff "say $HEADER WORLD BACKUP START.\015"'
  send_cmd 'stuff "save-all\015"'

  if [ ! -d $BACKUP_DIR ]; then
    mkdir $BACKUP_DIR
  fi

  mkdir $TEMP_DIR

  cp -Rf $COPY_DIR $TEMP_DIR

  cd $BACKUP_DIR

  zip -r world_$BACKUP_DATE.zip $TEMP_DIR

  rm -rf $TEMP_DIR
  find $BACKUP_DIR -type f -mtime $PERIOD -exec rm -f '{}' ';'

  send_cmd 'stuff "say $HEADER WORLD BACKUP COMPLETE.\015"'
}

# ./minecraft.sh 
if [[ "$1" == "" && ! -L "$0" ]]; then
  echo "Error: Operation not specified." >&2
  echo "Usage: $0 (start|stop|restart|kill|backup)">&2
  exit -1
fi

if [[ -L "$0" ]]; then
  action=${0##*/}
  action=${action##minecraft-}
else
  action=$1
fi

case "$action" in
  "start" )
    start_minecraft
    ;;
  "stop" )
    stop_minecraft
    ;;
  "restart" )
    send_cmd 'stuff "say $HEADER SERVER RESTERT...\015"'
    stop_minecraft
    start_minecraft

    /etc/rc.d/init.d/crond restart
    ;;
  "kill" )
     send_cmd 'stuff "say $HEADER SERVER RESTERT...\015"'
     kill_minecraft
     ;;
   "backup" )
     backup_minecraft
     ;;
   *)
     echo "Error: Invalid Operation" >&2
     exit -1
     ;;
esac

exit 0
