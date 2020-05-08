#!/bin/bash

cd $(dirname $0)
cd ../src/game2

export LANG="ja_JP.UTF-8"

pandoc -f markdown -t epub3-auto_identifiers \
 --toc-depth=1 \
 --css=../epub.css \
 -o ../../epub/game297.epub \
 game200.txt <(date "+%% %Y-%m-%d") game2*.md

# --epub-cover-image=./game2.png \

