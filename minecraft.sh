#!/bin/bash

source ./minecraft.conf

BACKUP_DATE=`date "+%Y%m%d%H%M"`

# This function is send command to Minecraft session on screen
# ex. send_cmd "say Hello"
function send_cmd {
  eval "screen -S $SESSION_NAME -p 0 -X eval 'stuff \"$1\015\"'"
}

function send_msg {
  hl_msg "$HEADER $1"
}

function hl_msg {
  send_cmd "say $1"
}

function kill_minecraft {
  send_cmd "save-all"
  send_msg "WORLD SAVING..."
  send_cmd "stop"
}

function start_minecraft {
  screen -AmdS $SESSION_NAME java -Xmx${JVM_RAM_MAX}M -Xms${JVM_RAM_MIN}M $JVM_OPTION -jar $SERVER_NAME.jar nogui
}

function stop_minecraft {
  #send_cmd "say $HEADER SERVER STOPPING..."
  send_msg "SERVER STOPPING..."
  i=$WAIT
  while [[ $i != 0 ]]; do
    echo "$i..."
    #send_cmd "say $HEADER $i..."
    send_msg "$i..."
    i=$(($i-1))
    sleep 1
  done
  echo "0"

  kill_minecraft

  echo "Done."
}

function backup_minecraft {
  #send_cmd "say $HEADER WORLD BACKUP START."
  send_msg "WORLD BACKUP START."
  send_cmd "save-all"

  if [ ! -d $BACKUP_DIR ]; then
    mkdir -p $BACKUP_DIR
  fi

  mkdir -p $TEMP_DIR

  cp -Rf $COPY_DIR $TEMP_DIR

  cd $BACKUP_DIR

  zip -r world_$BACKUP_DATE.zip $TEMP_DIR

  rm -rf $TEMP_DIR
  find $BACKUP_DIR -type f -mtime $PERIOD -exec rm -f '{}' ';'

  #send_cmd "say $HEADER WORLD BACKUP COMPLETE."
  send_msg "WORLD BACKUP COMPLETE."
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
    #send_cmd "say $HEADER SERVER RESTERT..."
    #send_cmd "say SERVER RESTERT..."
    send_msg "SERVER RESTERT..."
    stop_minecraft
    start_minecraft

    # TODO: systemctl & service
    #if [ -n "`which systemctl`" ]; then
    #  systemctl restart cron
    #elif [ -n "`which service`" ]; then
    #  service cron restart
    #else
      /etc/rc.d/init.d/crond restart
    #fi
    ;;
  "kill" )
     #send_cmd "say $HEADER SERVER STOPPING..."
     send_msg "SERVER STOPPING..."
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
