#!/bin/bash

cd $(dirname $0)
cd ../src/mngr

export LANG="ja_JP.UTF-8"

pandoc -f markdown -t epub3-auto_identifiers \
 --toc-depth=1 \
 --epub-cover-image=./mngr.png \
 --css=../epub.css \
 -o ../../epub/mngr97.epub \
 mngr000.txt mngr*.md

