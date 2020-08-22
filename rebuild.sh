#! /bin/bash

# Create "workshop/" directory with needed files from current
# version of "workshop" code hive.

rm -rf workshop
lua create_deploy.lua
./deploy.sh
mv deploy/workshop .
rm -rf deploy
