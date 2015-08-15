#!/bin/bash

cd ~/CI/task8/taskfolders

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
if [ $(curl -s -I -L http://192.168.122.16:9090/cdtask/  | grep HTTP/1.1 | awk {'print $2'}) == "200" ]
then
	echo "success!"
else
	echo "SHIT! sollback"
	
	cd ~/CI/task8/taskfolders

	mv ./old/*.tar.gz ./current/
	echo "old aftifact restored"

	cd ./dist
	tar -zxvf ../old/*.tar.gz
	echo "old artifact unpacking"

	rm -rf ~/custom/deploy/cdtask.war/*
	cp -r ./app/* ~/custom/deploy/cdtask.war/
	echo "old version copied into jboss application-folder"

	if [ $(curl -s -I -L http://192.168.122.16:9090/cdtask/  | grep HTTP/1.1 | awk {'print $2'}) == "200" ]
	then
		echo "Old version had been restored successfully"
	fi

fi
