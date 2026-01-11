#!/bin/sh

touch .env

touch Gemfile.lock

docker-compose build

# Full stack
# docker-compose run api rails new . --database=mysql

# API
docker-compose run api rails new . --database=mysql --api
docker-compose build

sed -ie 's/password:/password: password/g' config/database.yml
sed -ie 's/host: localhost/host: db/g' config/database.yml

docker-compose up -d

sleep 15

docker-compose exec db mysql -hdb -e "ALTER USER 'root'@'%' IDENTIFIED BY 'password';"
docker-compose exec api rails db:create

echo "# Mysql DB Volumes" >> .gitignore
echo "mysql/volumes/*" >> .gitignore
