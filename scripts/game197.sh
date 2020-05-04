#!/bin/bash

cd $(dirname $0)
cd ../src/game1

export LANG="ja_JP.UTF-8"

pandoc -f markdown -t epub3-auto_identifiers \
 --toc-depth=1 \
 --css=../epub.css \
 -o ../../epub/game197.epub \
 game100.txt game1*.md

# --epub-cover-image=./game1.png \

