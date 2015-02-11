#!/bin/sh

. ./minecraft.conf

BACKUP_DATE=`date "+%Y%m%d%H%M"`

screen -S $SESSION_NAME -p 0 -X eval 'stuff "say $HEADER WORLD BACKUP START.\015"'
screen -S $SESSION_NAME -p 0 -X eval 'stuff "save-all\015"'

# mkdir
mkdir $TEMP_DIR

if [ ! -d $BACKUP_DIR ]
then
	mkdir $BACKUP_DIR
fi

# copy
cp -Rf $COPY_DIR $TEMP_DIR

# cd
cd $BACKUP_DIR

# zip
zip -r world_$BACKUP_DATE.zip $TEMP_DIR

# delete
rm -rf $TEMP_DIR
find $BACKUP_DIR -type f -mtime $PERIOD -exec rm -f '{}' ';'

screen -S $SESSION_NAME -p 0 -X eval 'stuff "say $HEADER WORLD BACKUP COMPLETE.\015"'

