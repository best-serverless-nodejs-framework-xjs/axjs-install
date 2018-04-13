#!/usr/bin/env bash

killall node
# rm -rf ./package-lock.json ./npm-debug.log ./yarn.lock ./yarn-error.log
# rm -rf ./node_modules
# yarn install
yarn upgrade

mkdir -p ./app/entries/rest ./app/entries/web ./app/modules ./app/services ./app/plugins ./app/static
# cp -rvf ./node_modules/@ali/axjs/global.d.ts ./

echo "#!/bin/bash" >  ./cmd_upgrade.sh
echo "yarn run upgrade" >> ./cmd_upgrade.sh
echo "#!/bin/bash" >  ./cmd_make.sh
echo "./node_modules/@ali/axjs/cmd_make.sh" >> ./cmd_make.sh
echo "#!/bin/bash" >  ./cmd_debug.sh
echo "if [ \"\$1\" == \"x\" ]; then" >> ./cmd_debug.sh
echo "    killall node; exit 0;" >> ./cmd_debug.sh
echo "fi" >> ./cmd_debug.sh
echo "./node_modules/@ali/axjs/cmd_debug_app.sh \$1" >> ./cmd_debug.sh
echo "#!/bin/bash" >  ./cmd_publish.sh
echo "./node_modules/@ali/axjs/cmd_publish.sh \$1" >> ./cmd_publish.sh
chmod +x ./cmd_upgrade.sh ./cmd_make.sh ./cmd_debug.sh ./cmd_publish.sh