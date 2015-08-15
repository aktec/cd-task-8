#!/bin/bash

cd /home/Student/CI/task8/taskfolders

rm -rf ./old/*
rm -rf ./dist/*
echo "old artifact removed"

mv ./current/*.tar.gz ./old/
echo "currend aftifact saved into old"

mv ./predeploy/*.tar.gz ./current/
echo "new artifact saved"

cd ./dist
tar -zxvf ../current/*.tar.gz
echo "current artifact unpacking"

rm -rf ~/custom/deploy/cdtask.war/*
cp -r ./app/* ~/custom/deploy/cdtask.war/
echo "new version copied into jboss application-folder"

#twiddle.sh -s 192.168.122.16:1099 -u admin -p P@ssword invoke 'jboss.service:MainDeployer' redeploy "file:///home/Student/custom/deploy/cdtask.war"

echo "checking deploy"
#Getting to jboss some time for redeploying application
sleep 30

if [ $(curl -s -I -L http://192.168.122.16:9090/cdtask/  | grep HTTP/1.1 | awk {'print $2'}) == "200" ]
then
	echo "success!"
else
	bash ./rollback.sh	
fi
