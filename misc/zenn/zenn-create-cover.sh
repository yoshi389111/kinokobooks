#!/usr/bin/bash

cd $(dirname $0)/../images

# for WSL
FONTDIR=/mnt/c/Windows/Fonts

# color -> mono
for PREFIX in "prog" "soft" "mngr" "game1" "game2"
do
    convert "${PREFIX}_base.png" \
        -resize 1200x -charcoal 10 \
        -colorspace sRGB \
        -alpha set -background none -channel RGBA \
        -fill '#00000000' -fuzz 50% -draw 'matte 1,1 floodfill' \
        "${PREFIX}_mono.png"
done

# unofficial
convert \
 -size 1000x250 \
 -gravity center \
 -background black -fill white \
 -font $FONTDIR/meiryob.ttc \
 -pointsize 108 "label:非公式版" \
 -alpha set -background none \
 -rotate +45 +repage \
 -gravity southwest -crop 680x680+0+0 +repage \
 unofficial.png

# prog
convert -background none \
 -font $FONTDIR/meiryob.ttc \
 -pointsize 134 -strokewidth 3 -stroke gray \
 -fill white label:"プログラマ" \
 -fill black label:"が" \
 +append -write mpr:TITLE1 +delete \
 -fill black label:"知るべ" \
 -fill white label:"き" \
 -fill black label:"97" \
 -fill white label:"のこ" \
 -fill black label:"と" \
 +append -write mpr:TITLE2 +delete \
 mpr:TITLE1 mpr:TITLE2 -append prog_title.png

convert -size 1500x2100 xc:white \
 -page +0+0 -fill black \
 -font $FONTDIR/meiryob.ttc \
 -pointsize 84 -annotate +804+2055 "きのこ本 友の会" \
 -font $FONTDIR/georgiai.ttf \
 -pointsize 45 -annotate +92+118 \
 "Collective Wisdom from the Experts\n    97 Things Every Programmer\n                Should Know" \
 -fill "#B63E97" -draw "rectangle 67,0 1428,38" \
 -fill "#B63E97" -draw "rectangle 67,1499 1428,1963" \
 -page +134+1546 prog_title.png \
 -page +84+201 prog_mono.png \
 -page +820+0 unofficial.png \
 -layers flatten -resize 500x700 \
 prog_zenn.png

# soft
convert -background none \
 -font $FONTDIR/meiryob.ttc \
 -pointsize 100 -strokewidth 3 -stroke gray \
 -fill black label:"ソフトウェア" \
 -fill white label:"アーキテクト" \
 -fill black label:"が" \
 +append -write mpr:TITLE2 +delete \
 -fill black label:"知るべ" \
 -fill white label:"き" \
 -fill black label:"97" \
 -fill white label:"のこ" \
 -fill black label:"と" \
 +append -write mpr:TITLE3 +delete \
 mpr:TITLE1 mpr:TITLE2 mpr:TITLE3 -append soft_title.png

convert -size 1500x2100 xc:white \
 -page +0+0 -fill black \
 -font $FONTDIR/meiryob.ttc \
 -pointsize 84 -annotate +804+2055 "きのこ本 友の会" \
 -font $FONTDIR/georgiai.ttf \
 -pointsize 45 -annotate +92+118 \
 "Collective Wisdom from the Experts\n 97 Things Every\n Software Architect\n Should Know" \
 -fill "#01a36a" -draw "rectangle 67,0 1428,38" \
 -fill "#01a36a" -draw "rectangle 67,1499 1428,1963" \
 -page +95+1590 soft_title.png \
 -page +84-80 "(" soft_mono.png -resize 1400x ")" \
 -page +820+0 unofficial.png \
 -layers flatten -resize 500x700 \
 soft_zenn.png

# mngr
convert -background none \
 -font $FONTDIR/meiryob.ttc \
 -pointsize 100 -strokewidth 3 -stroke gray \
 -fill white label:"プロジェクト・マネジャー" \
 -fill black label:"が" \
 +append -write mpr:TITLE2 +delete \
 -fill black label:"知るべ" \
 -fill white label:"き" \
 -fill black label:"97" \
 -fill white label:"のこ" \
 -fill black label:"と" \
 +append -write mpr:TITLE3 +delete \
 mpr:TITLE1 mpr:TITLE2 mpr:TITLE3 -append mngr_title.png

convert -size 1500x2100 xc:white \
 -page +0+0 -fill black \
 -font $FONTDIR/meiryob.ttc \
 -pointsize 84 -annotate +804+2055 "きのこ本 友の会" \
 -font $FONTDIR/georgiai.ttf \
 -pointsize 45 -annotate +92+118 \
 "Collective Wisdom from the Experts\n 97 Things Every Project Manager\n Should Know" \
 -fill "#00adef" -draw "rectangle 67,0 1428,38" \
 -fill "#00adef" -draw "rectangle 67,1499 1428,1963" \
 -page +95+1590 mngr_title.png \
 -page +50-10 "(" mngr_mono.png -resize 1350x ")" \
 -page +820+0 unofficial.png \
 -layers flatten -resize 500x700 \
 mngr_zenn.png

# game1
convert -background none \
 -font $FONTDIR/meiryob.ttc \
 -pointsize 125 -strokewidth 3 -stroke gray \
 -fill white label:"ゲームクリエイター" \
 -fill black label:"が" \
 +append -write mpr:TITLE1 +delete \
 -fill black label:"知るべ" \
 -fill white label:"き" \
 -fill black label:"97" \
 -fill white label:"のこ" \
 -fill black label:"と" \
 +append -write mpr:TITLE2 +delete \
 mpr:TITLE1 mpr:TITLE2 -append game1_title.png

convert -size 1500x2100 xc:white \
 -page +0+0 -fill black \
 -font $FONTDIR/meiryob.ttc \
 -pointsize 84 -annotate +804+2055 "きのこ本 友の会" \
 -font $FONTDIR/georgiai.ttf \
 -pointsize 45 -annotate +92+118 \
 "Collective Wisdom from the Experts\n 97 Things Every Game Creator\n Should Know" \
 -fill "#f08000" -draw "rectangle 67,0 1428,38" \
 -fill "#f08000" -draw "rectangle 67,1499 1428,1963" \
 -page +125+1546 game1_title.png \
 -page +150-40 "(" game1_mono.png -resize 1150x ")" \
 -page +820+0 unofficial.png \
 -layers flatten -resize 500x700 \
 game1_zenn.png

# game2
convert -background none \
 -font $FONTDIR/meiryob.ttc \
 -pointsize 125 -strokewidth 3 -stroke gray \
 -fill white label:"②" \
 -fill black label:"❷" \
 -compose over -composite -write mpr:TITLE3 +delete \
 -fill white label:"ゲームクリエイター" \
 -fill black label:"が" \
 +append -write mpr:TITLE1 +delete \
 -fill black label:"知るべ" \
 -fill white label:"き" \
 -fill black label:"97" \
 -fill white label:"のこ" \
 -fill black label:"と" \
 mpr:TITLE3 \
 +append -write mpr:TITLE2 +delete \
 mpr:TITLE1 mpr:TITLE2 -append game2_title.png

convert -size 1500x2100 xc:white \
 -page +0+0 -fill black \
 -font $FONTDIR/meiryob.ttc \
 -pointsize 84 -annotate +804+2055 "きのこ本 友の会" \
 -font $FONTDIR/georgiai.ttf \
 -pointsize 45 -annotate +92+118 \
 "Collective Wisdom from the Experts\n 97 Things Every Game Creator\n Should Know #2" \
 -fill "#6eba3c" -draw "rectangle 67,0 1428,38" \
 -fill "#6eba3c" -draw "rectangle 67,1499 1428,1963" \
 -page +125+1546 game2_title.png \
 -page +70+320 "(" game2_mono.png -resize 1350x ")" \
 -page +820+0 unofficial.png \
 -layers flatten -resize 500x700 \
 game2_zenn.png

mkdir -p ../../zenn/prog-097-org
mkdir -p ../../zenn/soft-097-org
mkdir -p ../../zenn/mngr-097-org
mkdir -p ../../zenn/prog-097-jpn
mkdir -p ../../zenn/soft-097-jpn
mkdir -p ../../zenn/mngr-097-jpn
mkdir -p ../../zenn/game-097-one
mkdir -p ../../zenn/game-097-two

cp prog_zenn.png ../../zenn/prog-097-org/cover.png
cp soft_zenn.png ../../zenn/soft-097-org/cover.png
cp mngr_zenn.png ../../zenn/mngr-097-org/cover.png
mv prog_zenn.png ../../zenn/prog-097-jpn/cover.png
mv soft_zenn.png ../../zenn/soft-097-jpn/cover.png
mv mngr_zenn.png ../../zenn/mngr-097-jpn/cover.png
mv game1_zenn.png ../../zenn/game-097-one/cover.png
mv game2_zenn.png ../../zenn/game-097-two/cover.png

rm *_mono.png *_title.png unofficial.png
