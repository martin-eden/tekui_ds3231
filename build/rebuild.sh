#!/bin/bash

# Create "workshop/" directory with needed files from current
# version of "workshop" code hive.

# Author: Martin Eden
# Last mod.: 2026-06-01

set -eu

cd ../src

rm -rf workshop/

lua ../build/create_deploy.lua

bash deploy.sh
rm deploy.sh

mv deploy/workshop/ .
rm -rf deploy/
