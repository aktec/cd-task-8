#!/bin/bash
ARTIFACT_FILE=$1

echo $ARTIFACT_FILE
cd ~/CI/task8/taskfolders
rm -rf ./old/*
echo "old artifact removed"
mv "./current/$ARTIFACT_FILE" ./old/
echo "currend aftifact saved into old"
mv "./predeploy/$ARTIFACT_FILE" ./current/
echo "new artifact saved"
