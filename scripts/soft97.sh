#!/bin/bash

cd $(dirname $0)
cd ../src/soft

export LANG="ja_JP.UTF-8"

pandoc -f markdown -t epub3-auto_identifiers \
 --toc-depth=1 \
 --epub-cover-image=./soft.png \
 --css=../epub.css \
 -o ../../epub/soft97.epub \
 soft000.txt <(date "+%% %Y-%m-%d") soft*.md

