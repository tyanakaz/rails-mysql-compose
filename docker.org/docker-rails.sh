#!/bin/sh

mkdir docker.org
rsync -a * docker.org --exclude 'docker.org'
touch Gemfile.lock
docker-compose run web rails new . --force --database=mysql
sleep 5
docker-compose build

sed -ie 's/password:/password: password/g' config/database.yml
sed -ie 's/host: localhost/host: db/g' config/database.yml

docker-compose up -d
docker-compose run web rake db:create

sed -i 's/loofah (2.2.0)/loofah (2.2.2)/g' Gemfile.lock
docker-compose exec web bundle install
