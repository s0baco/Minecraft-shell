#!/bin/sh
cd "${0%/*}"
screen -AmdS minecraft java -XX:-UseVMInterruptibleIO -XX:ParallelGCThreads=3 -Xincgc -Xmx1536M -Xms1024M -Xmn512M -jar minecraft_server.1.8.1.jar nogui

