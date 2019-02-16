#!/usr/bin/bash

cd $(dirname $0)
cd ../src/prog

pandoc -f markdown -t epub3-auto_identifiers \
 --toc-depth=1 \
 --epub-cover-image=./prog.png \
 --epub-stylesheet=../epub.css \
 -o ../../epub/prog97.epub \
 prog000.txt prog*.md

