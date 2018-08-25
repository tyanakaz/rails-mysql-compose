#!/bin/sh

rsync -a docker.org/* . --exclude 'docker.org'

