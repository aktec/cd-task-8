#!/bin/bash
ARIFACT_FILE=$1

cd ~/CI/task8/taskfolders
rm -rf ./old/*.tar.gz
echo "old artifact removed"
mv ./current/$ARIFACT_FILE ./old
echo "currend aftifact saved into old"
mv ./predeploy/$ARTIFACT_FILE ./current
echo "new artifact saved"
