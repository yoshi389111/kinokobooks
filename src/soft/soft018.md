# 【18】一般性より単純性、再利用よりもまず最初に使えること{#e18}

<div class="author">ケブリン・ヘニー</div>

　コンポーネントフレームワーク、クラスライブラリ、ファウンデーションサービスなどのインフラコードには共通の欠点があります。具体的なアプリケーションを意識せず、汎用性だけを追求して設計されているものが多いのです。目もくらむほどのオプションが用意されていますが、それらの多くは使われないか、誤用されるか、役に立たないかです。ほとんどのデベロッパーは、特定のシステムを相手にしていますから、無制限に汎用性を追求しても、彼らのニーズに応えられることはまずありません。汎用性に至るルートとしてもっともよいのは、個別の具体例を理解し、そのエッセンスを煮詰めていくうちに、共通の解にたどり着くというものです。憶測による汎用性よりも、経験を通じた単純性の方が役に立つのです。

　よく似た設計案から 1 つを選択するときは、汎用性よりも単純性という価値基準が決め手になります。そのような 2 つの案があるときには、汎用性を誇る複雑な方ではなく、具体的なニーズを基礎とする単純な方を選びましょう。後から考えると、単純な解の方が実は汎用性が高かったということは、十分あり得ることです。たとえそうではなくて、必要だとわかったものに書き換えることになっても、単純なものを書き換える方が、汎用的だとは言い難い「一般的な」ものを書き換えるよりも簡単なはずです。

　単に汎用的であることを目標として設計された多くのものは、よく考えられていても、何の役にも立ちません。ソフトウェア・コンポーネントは、何よりもまず使えるように設計され、その用途で十分満足に使えなければなりません。優れた汎用性は理解から生まれますが、理解していれば単純なものが作られるものです。

　汎用化は、問題をより本質的な問題に還元し、いくつかの具体例に対する共通のアプローチを形にします。この共通点は、簡潔明快で、地に足が着いています。しかし、実際には汎用化すること自体が目的になっている場合が多すぎます。そのような汎用化は、互いに矛盾する方向に引き裂かれ、複雑さを取り除くどころかかえって増やしてしまいます。理論的な汎用性を追求すると、実際の開発が抱える現実と接点のないソリューションを作りがちです。それらは、後で誤りだったとわかるような前提を置き、後で役に立たないことがわかるような選択肢を提供し、容易に取り除けない重石を積み重ねていき、結局、デベロッパーや将来のアーキテクトに不必要な複雑さを押し付けてしまいます。

　多くのアーキテクトは汎用性を高く評価しますが、それは無条件であってはなりません。汎用性がまるまる役に立つことはありません。普通は特定の状況があり、役に立つのはその状況を解決してくれるものです。特定のソリューションを生み出そうと努力するうちに、汎用性や柔軟性を見つけられることはあります。しかし、だからといってすぐに個別の具体的な問題を忘れ、汎用性を追求すると、広い海の中で漂流することになってしまいます。トリッキーな設定オプション、多すぎるを通り越して過剰なパラメーターリスト、長々と続くインターフェイス、必ずしも正しいとは言えない抽象化といったものでいっぱいになった世界に放り出されるのです。気まぐれに柔軟性を追求すると、意図的であれ偶然であれ、単純な設計が持っている優れた性質をみすみす失うことが多いのです。