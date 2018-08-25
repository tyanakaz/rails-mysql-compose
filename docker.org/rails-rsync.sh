#!/bin/bash

mkdir docker.org
rsync -a * docker.org --exclude 'docker.org'
