#!/bin/sh

# Create asset

#
# Author: Martin Eden
# Last mod.: 2026-11-04
#

#
# Result is placed in "deploy/"
#
# There we will create executable file with combined Lua code.
#
# Toolchain uses my "lua code melder" tool to combine files into one:
#
#   https://github.com/martin-eden/lua_code_melder
#
# Toolchain uses my "lua code formatter" tool to strip comments:
#
#   https://github.com/martin-eden/lua_code_formatter
#

set -e -u

#
# src/
#

cd ../src

rm -r -f workshop/

lua ../builder/deploy.lua

mv deploy/workshop/ .
rm -r -f deploy/

#
# builder/
#

cd ../builder

# Combine all Lua code
./meld ../src/ run > ../deploy/ds3231_gui.melded.lua

# Reformat code and strip comments
./reformat_lua \
  ../deploy/ds3231_gui.melded.lua \
  ../deploy/ds3231_gui.melded.stripped.lua \
  --right-margin=72
rm ../deploy/ds3231_gui.melded.lua

#
# deploy/
#

cd ../deploy

# Add shebang
echo '#!/usr/local/bin/lua'"\n" > ds3231_gui.melded.stripped.shebanged.lua
# echo >> ds3231_gui.melded.stripped.shebanged.lua
cat ds3231_gui.melded.stripped.lua >> ds3231_gui.melded.stripped.shebanged.lua
rm ds3231_gui.melded.stripped.lua

# Finalize
mv \
  ds3231_gui.melded.stripped.shebanged.lua \
  ds3231_gui

chmod +x ds3231_gui

#
# 2026 #
# 2026-11-04
#
