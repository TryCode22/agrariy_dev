#!/bin/bash

# Fail on any error.
set -e

cd /workspace

#####################################
# Cloning repo in /workspace folder #
#####################################

# If the current directory is empty, we consider it the first start.
# As the code folder is mounted from Volume, we should avoid rewriting
# "/workspace" if something is already in this folder.
if [[ "$(ls -A .)" ]]; then
    echo 'Directory not empty. Skip cloning repo.'
else
    echo 'Directory is empty. Cloning repo...'

    # Clone the main repo inside the current directory.
    git clone git@github.com:TryCode22/agrariy_test.git .
fi

#####################################
# Installing dependencies and hooks #
#####################################

if [[ "$(ls -A .)" ]]; then
    echo 'Directoryis is not empty. Installing dependencies and hooks...'

    # Install deps for ruby
    bundle install -j nproc --all

    # Install deps for js
    yarn install

    # rbenv rehash
    rbenv rehash

    # Install overcommit hooks
    bundle exec overcommit --install
fi