#!/bin/sh

# 必要なファイルを作成
touch .env
touch Gemfile.lock

# 複数の docker image を build する  
docker-compose build


# Rail 関連ファイルの作成
# 
## Full stack mode
docker-compose run api rails new . --database=mysql
# 
## API mode
# docker-compose run api rails new . --database=mysql --api

# Rail 関連ファイルを読み込む
docker-compose build

# DB の接続設定
sed -ie 's/password:/password: password/g' config/database.yml
sed -ie 's/host: localhost/host: db/g' config/database.yml

# 起動時にエラーになるため設定を追加
sed -ie 's/config.file_watcher = ActiveSupport::EventedFileUpdateChecker/# config.file_watcher = ActiveSupport::EventedFileUpdateChecker/g' config/environments/development.rb

# アプリケーションサーバー（Rail）と　DB サーバー（MySQL）起動
docker-compose up -d

# DB が起動するまでスリープ
sleep 15

# DB サーバーに初期データベースを作成
docker-compose exec db mysql -hdb -e "ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'password';"
docker-compose exec api rake db:create

# Github にデータベースをコミットしないように設定
echo "# Mysql DB Volumes" >> .gitignore
echo "mysql/volumes/*" >> .gitignore

echo "Finished"
