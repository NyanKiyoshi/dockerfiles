#!/bin/sh

curl -Ls -o /dev/null -w '%{url_effective}' \
 https://github.com/Rigellute/spotify-tui/releases/latest | awk -F/ '{print $NF}'
