#!/bin/bash

# required ImageMagick
# sudo apt install imagemagick

cd $(dirname $0)
cd ../docs/images

export LANG="ja_JP.UTF-8"

SRCDIR="../../src"

# usage: create_ogp_image WIDTH HEIGHT TOP LEFT RIGHT LEFT2 RIGHT2 OUT
function create_ogp_image() {
    WIDTH=$1 # 1200
    HEIGHT=$2 # 840

    MAIN_W=$(( 500 * 3 / 4 ))  # 375 = 500 * 75%
    BACK_W=$(( $MAIN_W * 3 / 4 )) # 281
    BACK2_W=$(( $BACK_W * 3 / 4 )) # 210

    MAIN_H=$(( 800 * 3 / 4 ))  # 600 = 800 * 75%
    BACK_H=$(( $MAIN_H * 3 / 4 )) # 450
    BACK2_H=$(( $BACK_H * 3 / 4 )) # 337

    # 後ろは 1/3 だけ見えるように
    MAIN_X=$(( ( $WIDTH - $MAIN_W ) / 2 )) # 412
    LEFT_X=$(( $MAIN_X - $BACK_W / 3 )) # 319
    RIGHT_X=$(( $MAIN_X + $MAIN_W - $BACK_W * 2 / 3 )) # 600
    LEFT2_X=$(( $LEFT_X - $BACK2_W / 3 )) # 249
    RIGHT2_X=$(( $RIGHT_X + $BACK_W - $BACK2_W * 2 / 3 )) # 741

    # 高さはメイン表紙の上から 1/3 の位置を消失点にする
    MAIN_Y=$(( ( $HEIGHT - $MAIN_H ) / 2 )) # 120
    BACK_Y=$(( $MAIN_Y + ( $MAIN_H - $BACK_H ) / 3 )) # 170
    BACK2_Y=$(( $MAIN_Y + ( $MAIN_H - $BACK2_H ) / 3 )) # 207

    convert -size ${WIDTH}x${HEIGHT} tile:granite: \
        "(" "$6" -resize ${BACK2_W}x${BACK2_H} -repage +${LEFT2_X}+${BACK2_Y} ")" \
        "(" +clone -background black  -shadow 100x3+0+0 ")" +swap \
        "(" "$7" -resize ${BACK2_W}x${BACK2_H} -repage +${RIGHT2_X}+${BACK2_Y} ")" \
        "(" +clone -background black  -shadow 100x3+0+0 ")" +swap \
        "(" "$4" -resize ${BACK_W}x${BACK_H} -repage +${LEFT_X}+${BACK_Y} ")" \
        "(" +clone -background black  -shadow 100x3+0+0 ")" +swap \
        "(" "$5" -resize ${BACK_W}x${BACK_H} -repage +${RIGHT_X}+${BACK_Y} ")" \
        "(" +clone -background black  -shadow 100x3+0+0 ")" +swap \
        "(" "$3" -resize ${MAIN_W}x${MAIN_H} -repage +${MAIN_X}+${MAIN_Y} ")" \
        "(" +clone -background black  -shadow 100x3+0+0 ")" +swap \
        -layers merge "$8"
}

create_ogp_image 1200 840 "$SRCDIR/prog/prog.png" \
  "$SRCDIR/soft/soft.png" "$SRCDIR/mngr/mngr.png" \
  "$SRCDIR/game1/game1.png" "$SRCDIR/game2/game2.png" \
  prog97_ja.png
create_ogp_image 1200 840 "$SRCDIR/soft/soft.png" \
  "$SRCDIR/prog/prog.png" "$SRCDIR/mngr/mngr.png" \
  "$SRCDIR/game1/game1.png" "$SRCDIR/game2/game2.png" \
  soft97_ja.png
create_ogp_image 1200 840 "$SRCDIR/mngr/mngr.png" \
  "$SRCDIR/soft/soft.png" "$SRCDIR/prog/prog.png" \
  "$SRCDIR/game1/game1.png" "$SRCDIR/game2/game2.png" \
  mngr97_ja.png
create_ogp_image 1200 840 "$SRCDIR/game1/game1.png" \
  "$SRCDIR/prog/prog.png" "$SRCDIR/game2/game2.png" \
  "$SRCDIR/soft/soft.png" "$SRCDIR/mngr/mngr.png" \
  game197_ja.png
create_ogp_image 1200 840 "$SRCDIR/game2/game2.png" \
  "$SRCDIR/prog/prog.png" "$SRCDIR/game1/game1.png" \
  "$SRCDIR/soft/soft.png" "$SRCDIR/mngr/mngr.png" \
  game297_ja.png

create_ogp_image 1280 640 "$SRCDIR/prog/prog.png" \
  "$SRCDIR/soft/soft.png" "$SRCDIR/mngr/mngr.png" \
  "$SRCDIR/game1/game1.png" "$SRCDIR/game2/game2.png" \
  kinokobooks_ogp.png

cp prog97_ja.png prog97_en.png
cp soft97_ja.png soft97_en.png
cp mngr97_ja.png mngr97_en.png
