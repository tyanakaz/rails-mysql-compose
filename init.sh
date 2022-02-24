#!/bin/sh

REMOVEFILE="app db bin config config.ru Rakefile lib log public test tmp vendor package.json Gemfile.lock .env .gitattributes .ruby-version storage mysql/volumes"

git checkout Gemfile README.md .gitignore

rm -rf $REMOVEFILE

echo ====================================================================================================
echo remove $REMOVEFILE
echo ====================================================================================================
ls -al
echo ====================================================================================================
