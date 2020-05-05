#!/bin/bash

cd $(dirname $0)
cd ../src/mngr

rm -rf ../../docs/mngr_ja
mkdir ../../docs/mngr_ja

export LANG="ja_JP.UTF-8"

outindex="../../docs/mngr_ja/index.html"

sed -ne '1,/<!-- body -->/p' < index.html > $outindex

for NUM in $(seq 1 97) $(seq 101 111)
do
    echo "" > meta.txt
    infile=$(printf "mngr%03d.md" $NUM)
    outfile=$(printf "mngr%03d.htm" $NUM)

    title="$(head -1 $infile | sed -e 's/^# *//' -e 's/{#[0-9a-z]*}$//')"
    author="$(grep -F '<div class="author">' $infile | sed -e 's/<[^>]*>//g')"

    (
        echo "---"
        echo "pagetitle: '$title'"
        echo "sitetitle: 'プロジェクト・マネジャーが知るべき 97 のこと'"
        echo "---" >> meta.txt
    ) > meta.txt

    pandoc -f markdown -t html \
        --template mngr.pandoctemp \
        -o "../../docs/mngr_ja/$outfile" \
        -V lang=ja \
        -V locale="ja_JP" \
        -V outfile="$outfile" \
        "$infile" meta.txt

    echo "<li><a href=\"$outfile\">$title</a> by $author</li>" >> $outindex

done

sed -ne '/<!-- body -->/,$p' < index.html >> $outindex

rm -f meta.txt
