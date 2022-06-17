FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
ADD Gemfile /usr/src/app/Gemfile
ADD Gemfile.lock /usr/src/app/Gemfile.lock
RUN gem update --system # version 2.3.7に不具合があるため、Bundler のバージョンをあげる
RUN bundle install
ADD . /usr/src/app
