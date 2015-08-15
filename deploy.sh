#!/bin/bash
ARTIFACT_FILE=$1

echo $ARTIFACT_FILE
cd ~/CI/task8/taskfolders
rm -rf ./old/*
echo "old artifact removed"
mv ./current/*.tar.gz ./old/
echo "currend aftifact saved into old"
mv ./predeploy/*.tar.gz ./current/
echo "new artifact saved"
