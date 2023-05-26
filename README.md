# きのこ本を勝手に電子書籍化

　通称「きのこ本」とよばれるオライリー発行の書籍群があります。

　これらの書籍は CC-by-3.0 などでライセンスされており、著者名を明記すればコピー/配布や改変が自由にできます（商用利用も可能）。

　そこで、勝手に電子書籍（非公式版）を作っています。

　再利用しやすいように元データもマークダウン形式で置いてあるので、ライセンスの範囲内でご自由にご利用ください。ただ、標準のマークダウン書式ではなく pandoc の拡張書式を使っているところもあるので、pandoc でお好みの形式に変換してから使うと良いかと思います。
 
 　また、[zenn のサイト](https://zenn.dev/yoshi389111?tab=books)で同じ内容を公開していますので、見やすい方をお使いください（zenn では、章数の関係で日本語版での追加分は別のブック扱いになっています）。

![cover images](https://raw.githubusercontent.com/wiki/yoshi389111/kinokobooks/images/kinokobooks-logo.png)

## 日本語版(Japanese version)

* プログラマが知るべき 97 のこと【[web](https://yoshi389111.github.io/kinokobooks/prog_ja/)】/【 [epub](https://github.com/yoshi389111/kinokobooks/blob/main/epub/prog97.epub?raw=true) 】
* ソフトウェアアーキテクトが知るべき 97 のこと【[web](https://yoshi389111.github.io/kinokobooks/soft_ja/)】/【 [epub](https://github.com/yoshi389111/kinokobooks/blob/main/epub/soft97.epub?raw=true) 】
* プロジェクト・マネジャーが知るべき 97 のこと【[web](https://yoshi389111.github.io/kinokobooks/mngr_ja/)】/【 [epub](https://github.com/yoshi389111/kinokobooks/blob/main/epub/mngr97.epub?raw=true) 】
* ゲームクリエイターが知るべき 97 のこと【[web](https://yoshi389111.github.io/kinokobooks/game1/)】/【 [epub](https://github.com/yoshi389111/kinokobooks/blob/main/epub/game197.epub?raw=true) 】
* ゲームクリエイターが知るべき 97 のこと 2【[web](https://yoshi389111.github.io/kinokobooks/game2/)】/【 [epub](https://github.com/yoshi389111/kinokobooks/blob/main/epub/game297.epub?raw=true) 】

　誤字・脱字や問題などがあった場合には、詳細を `Issues` や `Pull requests` などで指摘いただけると助かります（もし修正する場合には `src` の下の markdown ファイルを対象としてください。 `docs` や `epub` の下のファイルは markdown からの生成物になります）。

　底本に含まれる前書き、監修注、著者の詳細、写真などは、本書には含まれていません。特に監修注は参考となる情報へのリンクが多数含まれています。
これらの情報が読みたい方は（あるいは底本・原本の関係者に敬意を表したい方は）オライリー本の購入を検討すると良いと思います。紙の本だけでなく、電子書籍もあるようです。pdf のみのもの、pdf/epub/mobi があるものなど書籍ごとに異なります。後述の書籍情報を見てください。

　また、底本の誤字・誤訳と思われるものは修正しています。修正内容は epub 版のあとがきに記載しています。
本来は Web 版や Zenn 版にも含めるべきだと思うのですが、現状含めることができていません。お手数ですが、以下のマークダウンファイルを直接見てください。
GitHub Flavored Markdown ではなく pandoc の拡張書式を使用したマークダウンになっているので、GitHub 上で見た場合に見た目がおかしい箇所があるかもしれませんが、ご了承願います。

* 「プログラマが知るべき 97 のこと」非公式版の[あとがき](https://github.com/yoshi389111/kinokobooks/blob/main/src/prog/prog999.md)
* 「ソフトウェアアーキテクトが知るべき 97 のこと」非公式版の[あとがき](https://github.com/yoshi389111/kinokobooks/blob/main/src/soft/soft999.md)
* 「プロジェクト・マネジャーが知るべき 97 のこと」非公式版の[あとがき](https://github.com/yoshi389111/kinokobooks/blob/main/src/mngr/mngr999.md)
* 「ゲームクリエイターが知るべき 97 のこと」非公式版の[あとがき](https://github.com/yoshi389111/kinokobooks/blob/main/src/game1/game199.md)
* 「ゲームクリエイターが知るべき 97 のこと 2」非公式版の[あとがき](https://github.com/yoshi389111/kinokobooks/blob/main/src/game2/game299.md)


## 英語版(English version)

* 97 Things Every Programmer Should Know【[web](https://yoshi389111.github.io/kinokobooks/prog_en/)】
* 97 Things Every Software Architect Should Know【[web](https://yoshi389111.github.io/kinokobooks/soft_en/)】
* 97 Things Every Project Manager Should Know【[web](https://yoshi389111.github.io/kinokobooks/mngr_en/)】

　英語版は書籍ベースではなく、以前オライリーで公開されていた wiki ベースの内容です。

　またエッセイの番号は、英語版と日本語版で違っているものがあります。ご注意ください。

## 書籍情報と底本

* リンク切れの Wiki がみたい方は Internet Archive 等で確認してください。

【プログラマが知るべき97のこと】

* 書籍情報 [プログラマが知るべき97のこと](https://www.oreilly.co.jp/books/9784873114798/) 日本語版
  * 文字起こしに使用した底本：2013 年 4 月 19 日 初版第 8 刷
* 書籍情報 [97 Things Every Programmer Should Know](http://oreilly.com/catalog/9780596809492/) 英語版
  * 英語版 Wiki(リンク切れ) `http://programmer.97things.oreilly.com/`

【ソフトウェアアーキテクトが知るべき97のこと】

* 書籍情報 [ソフトウェアアーキテクトが知るべき97のこと](https://www.oreilly.co.jp/books/9784873114293/) 日本語版
  * 文字起こしに使用した底本：2009 年 10 月 2 日 初版第 1 刷
* 書籍情報 [97 Things Every Software Architect Should Know](http://oreilly.com/catalog/9780596522704/) 英語版
  * 英語版 Wiki(リンク切れ) `http://softarch.97things.oreilly.com/`
  * 英語版 Wiki2(リンク切れ) `http://architect.97things.oreilly.com/`

【プロジェクト・マネジャーが知るべき97のこと】

* 書籍情報 [プロジェクト・マネジャーが知るべき97のこと](https://www.oreilly.co.jp/books/9784873115108/) 日本語版
  * 文字起こしに使用した底本：2016 年 5 月 16 日 初版第 3 刷
* 書籍情報 [97 Things Every Project Manager Should Know](http://oreilly.com/catalog/9780596804152/) 英語版
  * 英語版 Wiki(リンク切れ) `http://pm.97things.oreilly.com/`

【ゲームクリエイターが知るべき97のこと】

* 書籍情報 [ゲームクリエイターが知るべき97のこと](https://www.oreilly.co.jp/books/9784873115702/)
  * 文字起こしに使用した底本：2012 年 11 月 27 日 初版第 2 刷
* 書籍情報 [ゲームクリエイターが知るべき97のこと 2](https://www.oreilly.co.jp/books/9784873116228/)
  * 文字起こしに使用した底本：2013 年 8 月 23 日 初版第 1 刷

## 非公式版の表紙に使用している画像について

「プログラマが知るべき97のこと」（非公式版）の表紙に使用した画像は、Wikipedia の「シイタケ」の項から借用し、加工しました。 この画像は [CC-by-2.0（表示 2.0 一般）](https://creativecommons.org/licenses/by/2.0/)でライセンスされています。

* https://commons.wikimedia.org/wiki/File:Shiitakegrowing.jpg
  * Author: frankenstoen from Portland, Oregon

「ソフトウェアアーキテクトが知るべき97のこと」（非公式版）の表紙に使用した画像は、Wikipedia の「ササクレヒトヨタケ」の項から借用し、加工しました。この画像は [CC-by-3.0(表示 3.0 非移植)](https://creativecommons.org/licenses/by/3.0/) でライセンスされています。

* https://commons.wikimedia.org/wiki/File:Coprin-chevelu-20080831.jpg
  * Author: Thierryyyyyyy

「プロジェクト・マネジャーの知るべき97のこと」（非公式版）の表紙に使用した画像は、Wikipedia の「カラカサタケ」の項から借用し、加工しました。この画像はパブリックドメインです。

* https://commons.wikimedia.org/wiki/File:Macrolepiota_procera_2013_G1.jpg
  * Author: George Chernilevsky


「ゲームクリエイターが知るべき97のこと」（非公式版）の表紙に使用した画像は、Wikipedia の「エリンギ」の項から借用し、加工しました。この画像はパブリックドメインです。

* https://commons.wikimedia.org/wiki/File:Pleurotus_eryngii.jpg
  * Author: Lemon-s


「ゲームクリエイターが知るべき97のこと 2」（非公式版）の表紙に使用した画像は、Wikipedia の「ヒラタケ」の項から借用し、加工しました。この画像は [CC0-1.0(1.0 全世界)](https://creativecommons.org/publicdomain/zero/1.0/) でライセンスされています。

* https://commons.wikimedia.org/wiki/File:Pleurotus_ostreatus,_Japan_1.JPG
  * Author: Qwert1234
