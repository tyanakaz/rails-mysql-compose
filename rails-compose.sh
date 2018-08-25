#!/bin/sh

touch Gemfile.lock

docker-compose run api rails new . --force-rm --database=mysql 

sleep 5 

docker-compose build --force-rm

sleep 5

sed -ie 's/password:/password: password/g' config/database.yml 
sed -ie 's/host: localhost/host: db/g' config/database.yml

docker-compose up -d && docker-compose exec api rake db:create
