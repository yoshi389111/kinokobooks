# 【57】ポリモーフィズムの利用機会を見逃さない{#e57}

<div class="author">カーク・ペパーディーン（Kirk Pepperdine）</div>

　「ポリモーフィズム」は、オブジェクト指向の基礎を成す重要な概念です。元々はギリシャ語で「多数」を意味する“poly”と「形」を意味する“morph”に由来します。プログラミングにおいてポリモーフィズムとは、同じクラスのオブジェクトやメソッドが複数の形（form）を取り得るということを意味します。しかしポリモーフィズムは、ただ単に実装が複数になるということを意味しているのではありません。ポリモーフィズムをうまく使えば、オブジェクトやメソッドの特性、動きを、コンテキストに応じて細かく変えることができます。しかも、そのために冗長な if-then-else ブロックを書く必要がないのです。そのかわり、コンテキストによってオブジェクトやメソッドが自動的に形を変えるためには、「このコンテキストならこのオブジェクト、あるいはメソッドを使う」というコードをあらかじめコンテキストの外で書いておく必要があります。ポリモーフィズムを有効に活かせば、その分コードの量が減り、読みやすくなります。そのメリットがよくわかるコード例（実用的なものとは言えませんが……）を 1 つ見てみましょう。シンプルなショッピングカートのコードです。

```java
public class ShoppingCart {
    private ArrayList<Item> cart = new ArrayList<Item>();
    public void add(Item item) { cart.add(item); }
    public Item takeNext() { return cart.remove(0); }
    public boolean isEmpty() { return cart.isEmpty(); }
}
```

　仮に、この Web ショップでは、ダウンロードできる商品と、物理的な配送を必要とする商品の両方を扱っているとしましょう。それに対応するためには、たとえば次のようなクラスを作ることになります。

```java
public class Shipping {
    public boolean ship(Item item, SurfaceAddress address) {...}
    public boolean ship(Item item, EMailAddress address) {...}
}
```

　顧客が注文手続きを済ませたら、次のコードで商品のダウンロード、あるいは配送を開始します。

```java
while (!cart.isEmpty()) {
    shipping.ship(cart.takeNext(), ???);
}
```

　“`???`”という部分は、実際にこう書くわけではありません（こういう演算子が本当にあるわけではありません）。ここは、コンテキストによって、e メールアドレスか配送先の住所が入るはずのところです。つまり上記の例では、実際にどちらを入れるのかを決めるコード、つまりコンテキストを決めるコードが足りないということになります。`boolean` や `enum` と、`if-then-else` ブロックを使えば、このパラメータに入る値は決定できます。他には、`Item` を継承するクラスを 2 つ作るという方法も考えられます。ここでは、その 2 つのクラスに `DownloadableItem`、`SurfaceItem` という名前をつけることにしましょう。それぞれのコードは次のとおりです。この場合、`Item` は正確にはクラスではなくインタフェースで、`ship` というメソッドを 1 つ持っています。ショッピングカートに入った商品が出荷される際には `item.ship(shipper)` が呼び出されます。`DownloadableItem`、`SurfaceItem` という 2 つのクラスではいずれもこの `ship` メソッドを実装しています。

```java
public class DownloadableItem implements Item {
    public boolean ship(Shipping shipper, Customer customer) {
        shipper.ship(this, customer.getEmailAddress());
    }
}
public class SurfaceItem implements Item {
    public boolean ship(Shipping shipper, Customer customer) {
        shipper.ship(this, customer.getSurfaceAddress());
    }
}
```

　この例では、`Shipping` クラスの `ship` メソッドを呼び出す仕事を `Item` クラスに委譲しています。物理的に配送すればいいのか、ダウンロードの方がいいのかという指定は `Item` クラスが自動的にするので、if-then-else ブロックを書かなくても、商品ごとに適切な出荷ができます。上記のコードは、Command パターンと Double Dispatch パターンという 2 つのパターンの使用例でもあります。この 2 つは、組み合わせて使うと効果的なことが多いパターンです。2 つのパターンを組み合わせる上で重要になるのが、ポリモーフィズムをうまく利用することです。それができれば、if-then-else ブロックの数を減らすことができるのです。

　もちろん、ポリモーフィズムを利用するより、if-then-else ブロックを使った方が良いという場合も時にはあります。しかし、ポリモーフィズムを利用する方が、コードが読みやすく、またバグも少なくなる可能性が高いのです。コードの中に今、if-then-else ブロックになっている箇所があるのなら、そのすべてについてポリモーフィズムが使えないか検討した方が良い、と言ってもいいでしょう。
