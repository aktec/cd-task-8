#!/bin/bash

cd ~/CI/task8/taskfolders

rm -rf ./old/*
echo "old artifact removed"

mv ./current/*.tar.gz ./old/
echo "currend aftifact saved into old"

mv ./predeploy/*.tar.gz ./current/
echo "new artifact saved"

cd ./dist
tar -zxvf ../current/*.tar.gz\
echo "current artifact unpacking"

rm -rf ~/custom/deploy/cdtask.war/*
cp -r ./* ~/custom/deploy/cdtask.war/
echo "new version copied into jboss application-folder"

#twiddle.sh -s 192.168.122.16:1099 -u admin -p P@ssword invoke 'jboss.service:MainDeployer' redeploy "file:///home/Student/custom/deploy/cdtask.war"
