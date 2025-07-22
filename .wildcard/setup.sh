#!/bin/bash

# Your script here

createdb jobsdb
createuser --superuser rudder
psql "jobsdb" -c "alter user rudder with encrypted password 'rudder'";
psql "jobsdb" -c "grant all privileges on database jobsdb to rudder";

git submodule init
git submodule update

cd /workspace/repo/rudder-transformer

npm i

node destTransformer.js

cd /workspace/repo

export WORKSPACE_TOKEN=$WORKSPACE_TOKEN