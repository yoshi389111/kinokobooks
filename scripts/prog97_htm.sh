#!/bin/bash

cd $(dirname $0)
cd ../src/prog

rm -rf ../../docs/prog_ja
mkdir ../../docs/prog_ja

export LANG="ja_JP.UTF-8"

outindex="../../docs/prog_ja/index.htm"

sed -ne '1,/<!-- body -->/p' < index.htm > $outindex

for NUM in $(seq 1 97) $(seq 101 110)
do
    echo "" > meta.txt
    infile=$(printf "prog%03d.md" $NUM)
    outfile=$(printf "prog%03d.htm" $NUM)

    title="$(head -1 $infile | sed -e 's/^# *//' -e 's/{#[0-9a-z]*}$//')"
    author="$(grep -F '<div class="author">' $infile | sed -e 's/<[^>]*>//g')"

    (
        echo "---"
        echo "pagetitle: '$title'"
        echo "sitetitle: 'プログラマが知るべき 97 のこと'"
        echo "---" >> meta.txt
    ) > meta.txt

    pandoc -f markdown -t html \
        --template prog.pandoctemp \
        -o "../../docs/prog_ja/$outfile" \
        -V lang=ja \
        -V locale="ja_JP" \
        -V outfile="$outfile" \
        "$infile" meta.txt

    echo "<li><a href=\"$outfile\">$title</a> by $author</li>" >> $outindex

done

sed -ne '/<!-- body -->/,$p' < index.htm >> $outindex

cp -p prog045.png ../../docs/prog_ja/

rm -f meta.txt
