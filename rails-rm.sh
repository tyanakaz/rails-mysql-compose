#!/bin/sh

REMOVEFILE="app db bin config config.ru lib log public test tmp vendor package.json Gemfile.lock"

git checkout .

rm -rf $REMOVEFILE

echo ====================================================================================================
echo remove $REMOVEFILE
echo ====================================================================================================
ls -al
echo ====================================================================================================
