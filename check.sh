#!/usr/bin/env bash

ldd $(which inkscape) | grep found

FILE1=/tmp/ink$RANDOM.png
FILE2=/tmp/ink$RANDOM.svg

inkscape --without-gui --file=./drawing.svg \
  --export-area-drawing --export-text-to-path --vacuum-defs --export-plain-svg=$FILE2 \
  --export-width=1024 --export-png=$FILE1

curl --upload-file $FILE1 https://transfer.sh/$(basename $FILE1)
curl --upload-file $FILE2 https://transfer.sh/$(basename $FILE2)