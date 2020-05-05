#!/bin/bash

BOOKNAME="プロジェクト・マネジャーが知るべき 97 のこと"
PREFIX="mngr"
TEMPLATE="$PREFIX.pandoctemp"
OUTDIR="../../docs/${PREFIX}_ja"
OUTINDEX="$OUTDIR/index.html"
NUMBERS="$(seq 1 97) $(seq 101 111)"
METAFILE="meta.txt"

cd $(dirname $0)
cd "../src/$PREFIX"

rm -rf "$OUTDIR"
mkdir "$OUTDIR"

export LANG="ja_JP.UTF-8"

sed -ne '1,/<!-- body -->/p' < index.html > "$OUTINDEX"

for NUM in $NUMBERS
do
    INFILE=$(printf "%s%03d.md" $PREFIX $NUM)
    OUTFILE=$(printf "%s%03d.htm" $PREFIX $NUM)

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
        "$INFILE" "$METAFILE"

    # TODO escape
    echo "<li><a href=\"$OUTFILE\">$TITLE</a> by $AUTHOR</li>" >> "$OUTINDEX"

done

sed -ne '/<!-- body -->/,$p' < index.html >> "$OUTINDEX"

rm -f "$METAFILE"
