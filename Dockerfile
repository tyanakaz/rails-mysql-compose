# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
FROM ruby:3.3.5-slim

RUN apt-get update -qq && apt-get install -y build-essential ruby-dev libmariadb-dev-compat libmariadb-dev

WORKDIR /app

# GemfileとGemfile.lockをコンテナにコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Bundlerを使用してGemをインストール
RUN bundle install

# アプリケーションの残りの部分をコンテナにコピー
COPY . /app