#!/bin/sh

REMOVEFILE="app db bin config config.ru  Rakefile lib log public test tmp vendor package.json Gemfile.lock .env .gitattributes .ruby-version storage"

git checkout Gemfile README.md

rm -rf $REMOVEFILE

echo ====================================================================================================
echo remove $REMOVEFILE
echo ====================================================================================================
ls -al
echo ====================================================================================================
