#!/bin/bash
echo "SHIT! sollback"
    
cd /home/Student/CI/task8/taskfolders
	
rm -rf ./current/*
	
cp ./old/*.tar.gz ./current/
echo "old aftifact restored"

cd ./dist
tar -zxvf ../current/*.tar.gz
echo "old artifact unpacking"

rm -rf ~/custom/deploy/cdtask.war/*
cp -r ./app/* ~/custom/deploy/cdtask.war/
echo "old version copied into jboss application-folder"

echo "Checking old version"
sleep 30

if [ $(curl -s -I -L http://192.168.122.16:9090/cdtask/  | grep HTTP/1.1 | awk {'print $2'}) == "200" ]
then
    echo "Old version had been restored successfully"
else
    echo "Something goes wrong"
fi

