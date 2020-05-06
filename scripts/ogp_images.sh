#!/bin/bash

# required ImageMagick
# sudo apt install imagemagick

cd $(dirname $0)
cd ../docs/images

export LANG="ja_JP.UTF-8"

BASEDIR="../../src"

# usage: create_ogp_image top.png left.png right.png output.png
function create_ogp_image() {
    convert -size 1200x840 tile:granite: \
        "(" "$2" -resize 281x450 -repage +272+170 ")" \
        "(" +clone -background black  -shadow 100x3+0+0 ")" +swap \
        "(" "$3" -resize 281x450 -repage +646+170 ")" \
        "(" +clone -background black  -shadow 100x3+0+0 ")" +swap \
        "(" "$1" -resize 375x600 -repage +412+120 ")" \
        "(" +clone -background black  -shadow 100x3+0+0 ")" +swap \
        -layers merge "$4"
}

create_ogp_image "$BASEDIR/prog/prog.png" "$BASEDIR/soft/soft.png" "$BASEDIR/mngr/mngr.png" prog97_ja.png
create_ogp_image "$BASEDIR/soft/soft.png" "$BASEDIR/prog/prog.png" "$BASEDIR/mngr/mngr.png" soft97_ja.png
create_ogp_image "$BASEDIR/mngr/mngr.png" "$BASEDIR/prog/prog.png" "$BASEDIR/soft/soft.png" mngr97_ja.png

cp prog97_ja.png prog97_en.png
cp soft97_ja.png soft97_en.png
cp mngr97_ja.png mngr97_en.png
