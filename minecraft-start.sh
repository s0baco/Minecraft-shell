#!/bin/sh
SESSION_NAME="minecraft"
SERVER_NAME="minecraft_server.1.8.1"
JVM_OPTION="-XX:-UseVMInterruptibleIO -XX:ParallelGCThreads=3 -Xincgc -Xmx1536M -Xms1024M -Xmn512M"

screen -AmdS $SESSION_NAME java $JVM_OPTION -jar $SERVER_NAME.jar nogui

