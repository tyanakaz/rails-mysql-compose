#!/bin/sh

read -p "ok? (y/N): " yn
case "$yn" in [yY]*) ;; *) echo "NO" ; exit ;; esac

LIST=`docker ps -a | awk '{print $1}' | grep -v "CONTAINER"`
for line in `echo $LIST`
do
   docker stop $line
   docker rm $line
done


for line in `docker images | awk '{print $3}' | grep -v "IMAGE"`
do
   docker rmi -f $line
done

echo ====================================================================================================
docker ps -a
echo ====================================================================================================
docker images
echo ====================================================================================================
