#!/bin/sh

. ./minecraft.conf

screen -AmdS ${SESSION_NAME} java -Xmx{JVM_RAM_MAX}M -Xms{JVM_RAM_MIN} ${JVM_OPTION} -jar ${SERVER_NAME}.jar nogui
