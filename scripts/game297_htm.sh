#!/bin/bash

BOOKNAME="ゲームクリエイターが知るべき 97 のこと 2"
PREFIX="game2"
TEMPLATE="$PREFIX.pandoctemp"
OUTDIR="../../docs/${PREFIX}"
OUTINDEX="$OUTDIR/index.html"
METAFILE="meta.txt"

cd $(dirname $0)
cd "../src/$PREFIX"

rm -rf "$OUTDIR"
mkdir "$OUTDIR"

export LANG="ja_JP.UTF-8"

# usage: create_a_page_and_index START_NUM END_NUM NUM
function create_a_page_and_index() {

    START_NUM="$1"
    END_NUM="$2"
    NUM="$3"

    INFILE=$(printf "%s%02d.md" $PREFIX $NUM)
    OUTFILE=$(printf "%s%02d.htm" $PREFIX $NUM)
    if [ $START_NUM -eq $NUM ] ; then
        PREVFILE=""
    else
        PREVFILE=$(printf "%s%02d.htm" $PREFIX $(($NUM - 1)))
    fi
    if [ $END_NUM -eq $NUM ] ; then
        NEXTFILE=""
    else
        NEXTFILE=$(printf "%s%02d.htm" $PREFIX $(($NUM + 1)))
    fi

    TITLE="$(head -1 $INFILE | sed -e 's/^# *//' -e 's/{#[0-9a-z]*}$//')"
    AUTHOR="$(grep -F '<div class="author">' $INFILE | sed -e 's/<[^>]*>//g')"

    (
        echo "---"
        echo "pagetitle: '$TITLE'"
        echo "sitetitle: '$BOOKNAME'"
        echo "---"
    ) > "$METAFILE"

    pandoc -f markdown -t html \
        --template "$TEMPLATE" \
        -o "$OUTDIR/$OUTFILE" \
        -V lang="ja" \
        -V locale="ja_JP" \
        -V outfile="$OUTFILE" \
        -V prevfile="$PREVFILE" \
        -V nextfile="$NEXTFILE" \
        "$INFILE" "$METAFILE"

    # TODO escape
    echo "<li><a href=\"$OUTFILE\">$TITLE</a> by $AUTHOR</li>" >> "$OUTINDEX"

}

# usage: create_pages_and_indices START_NUM END_NUM
function create_pages_and_indices() {
    START_NUM="$1"
    END_NUM="$2"

    for NUM in $(seq $START_NUM $END_NUM)
    do
        create_a_page_and_index $START_NUM $END_NUM $NUM
    done
}

sed -ne '1,/<!-- body -->/p' < index.html > "$OUTINDEX"
create_pages_and_indices 1 97
sed -ne '/<!-- body -->/,$p' < index.html >> "$OUTINDEX"
rm -f "$METAFILE"
