#!/bin/sh

. ./minecraft.conf

screen -S ${SESSION_NAME} -p 0 -X eval 'stuff "say ${HEADER} WORLD BACKUP START.\015"'
screen -S ${SESSION_NAME} -p 0 -X eval 'stuff "save-all\015"'

# mkdir
mkdir ${TEMP_DIR}

if [ ! -d ${BACKUP_DIR} ]
then
	mkdir ${BACKUP_DIR}
fi
# copy
cp -Rf ${COPY_DIR} ${TEMP_DIR}

# cd
cd ${BACKUP_DIR}

# zip
zip -r world_$BACKUP_DATE.zip ${TEMP_DIR}

# del temp
rm -rf ${TEMP_DIR}

screen -S ${SESSION_NAME} -p 0 -X eval 'stuff "say $HEADER WORLD BACKUP COMPLETE.\015"'

