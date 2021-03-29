#!/bin/bash

cd $(dirname $0)
cd ../src/game1

export LANG="ja_JP.UTF-8"

pandoc -f markdown -t epub3-auto_identifiers \
 --toc-depth=1 \
 --epub-cover-image=./game1.png \
 --css=../epub.css \
 -o ../../epub/game197.epub \
 game100.txt <(date "+%% %Y-%m-%d") game1*.md


