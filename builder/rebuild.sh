#!/bin/bash

# Create "workshop/" directory with needed files from current
# version of "workshop" code hive.

# Author: Martin Eden
# Last mod.: 2026-11-04

set -eu

cd ../src

rm -rf workshop/

lua ../build/deploy.lua

mv deploy/workshop/ .
rm -rf deploy/

#
# 2026 #
# 2026-11-04
#
