#!/usr/bin/env bash

REMOTE="ec2c"
REMOTE_GRAV_FOLDER="/var/www/html/"
REMOTE_TEMP_FILE_PATH="/tmp/temp.zip"
REMOTE_PERFMIX_NAME="permfixUbuntu.sh"

cd grav
sudo zip -rq temp.zip . -x cache/\* logs/\*
scp ./temp.zip $REMOTE:$REMOTE_TEMP_FILE_PATH
ssh -t $REMOTE "rm -rf $REMOTE_GRAV_FOLDER*"
ssh -t $REMOTE "mkdir "$REMOTE_GRAV_FOLDER"logs "$REMOTE_GRAV_FOLDER"cache"
ssh -t $REMOTE "unzip -oq $REMOTE_TEMP_FILE_PATH -d $REMOTE_GRAV_FOLDER"
ssh -t $REMOTE "cd $REMOTE_GRAV_FOLDER && sudo ./$REMOTE_PERFMIX_NAME"
ssh -t $REMOTE "rm $REMOTE_TEMP_FILE_PATH"
sudo rm temp.zip
