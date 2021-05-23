#!/bin/bash

BOOKNAME="プロジェクト・マネジャーが知るべき 97 のこと"
PREFIX="mngr"
OUTDIR="../../zenn/${PREFIX}-097-org"
METAFILE="meta.txt"
CONFIG="config.yaml"

cd $(dirname $0)
cd "../../src/$PREFIX"
export LANG="ja_JP.UTF-8"

rm -f "$OUTDIR/*.md"
mkdir -p "$OUTDIR"

# usage: create_a_page START_NUM END_NUM NUM
function create_a_page() {

    START_NUM="$1"
    END_NUM="$2"
    NUM="$3"

    INFILE=$(printf "%s%03d.md" $PREFIX $NUM)
    OUTFILE=$(printf "%s-%03d.md" $PREFIX $NUM)

    TITLE="$(head -1 $INFILE | sed -e 's/^# *//' -e 's/{#[0-9a-z]*}$//')"
    AUTHOR="$(grep -F '<div class="author">' $INFILE | sed -e 's/<[^>]*>//g')"

    (
        echo "---"
        echo "pagetitle: '$TITLE'"
        echo "sitetitle: '$BOOKNAME'"
        echo "---"
    ) > "$METAFILE"

    pandoc -f markdown -t gfm \
        -o "$OUTDIR/$OUTFILE" \
        --wrap=preserve \
        -V lang="ja" \
        -V locale="ja_JP" \
        "$INFILE" "$METAFILE"

    sed -i -e '/^# /d' "$OUTDIR/$OUTFILE"
    sed -i -e '/<div/d' "$OUTDIR/$OUTFILE"
    sed -i -e '/<\/div/d' "$OUTDIR/$OUTFILE"

    sed -i -e 's/<span[^>]*>//g' "$OUTDIR/$OUTFILE"
    sed -i -e 's/<\/span>//g' "$OUTDIR/$OUTFILE"

    sed -i -e 's/\([0-9a-z.]*\)<sup>\([^<]*\)<\/sup>/$\1^{\2}$/g' "$OUTDIR/$OUTFILE"
    sed -i -e 's/\([0-9a-z.]*\)<sub>\([^<]*\)<\/sub>/$\1_{\2}$/g' "$OUTDIR/$OUTFILE"

    sed -i "1i---\ntitle: \"$TITLE\"\n---" "$OUTDIR/$OUTFILE"
}

# usage: create_pages START_NUM END_NUM
function create_pages() {
    START_NUM="$1"
    END_NUM="$2"

    for NUM in $(seq $START_NUM $END_NUM) ; do
        create_a_page $START_NUM $END_NUM $NUM
        CHAPTER=$(printf "%s-%03d" $PREFIX $NUM)
        echo "  - $CHAPTER" >> $OUTDIR/$CONFIG
    done
}

cat <<EOD > $OUTDIR/$CONFIG
title: "${BOOKNAME}"
summary: "通称「きのこ本」とよばれるオライリー発行の書籍群があります。\nこれらの書籍は CC-by-3.0 などでライセンスされており、著者名を明記すればコピー/配布や改変が自由にできます（商用利用も可能）。\nそこで、勝手に電子書籍化（非公式版）を作っています。\n詳細は https://github.com/yoshi389111/kinokobooks まで"
topics: ["プロジェクトマネージャー", "きのこ本"]
published: true
price: 0
toc_depth: 1
chapters:
EOD

create_pages 1 97
rm -f "$METAFILE"

sed -i -e '/<ul/,/<\/ul>/s/^\([^<].*\)/9.7. \1/' "$OUTDIR/mngr-097.md"
sed -i -e '/<ul/,/<li>/d' "$OUTDIR/mngr-097.md"
sed -i -e '/<\/li/,/<\/ul>/d' "$OUTDIR/mngr-097.md"
