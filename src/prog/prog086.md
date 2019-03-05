# 【86】WET なシステムはボトルネックが見つかりにくい{#e86}

<div class="author">カーク・ペパーディーン（Kirk Pepperdine）</div>

　DRY（Don’t Repeat Yourself：同じことを繰り返すな）原則は、非常に重要なものです。これは、1 つのシステムの中で同じものが重複することがあってはならないという原則です。言い換えれば、1 つの知識に対応する実装は必ず 1 つにする、ということです。DRY 原則に反しているシステムを、「WET（Write Every Time：必要なものをその都度書く）なシステム」と呼ぶことがあります。WET なシステムには、同じ知識に対応する実装が複数存在します。DRY なシステムと WET なシステムでは、パフォーマンスに違いが生じます。そのことは、DRY であること、WET であることが具体的にどういう側面にどう影響するかを知れば、明確にわかるでしょう。

　たとえば、あるシステムに、CPU ボトルネックになっている機能があるとします。その機能を仮に、「機能 X」と呼ぶことにします。そして、機能 X が CPU の 30% を消費しているとしましょう。もし機能 X に 10 種類の実装があるとしたら、個々の実装は、平均して CPU の 3% を消費しているということになります。この場合は、じっくり見なければ、機能 X がボトルネックになっていることに気づきにくいでしょう。3% の CPU 消費自体は多くないからです。また、仮に機能 X がボトルネックであると認識できたとしても、10 種類の実装をすべて見つけ、個々に修正を施さなくてはならないという問題があります。1 つの機能の実装が 10 個存在するのは、WET なシステムであると言えます。もし DRY 原則に従ってシステムが作られていれば、機能 X が CPU を 30% 消費している事実にすぐに発見できる上、修正するコードも 1/10 で済むでしょう。そもそも、10 の実装をすべて見つけ出すための時間も手間も必要ありません。

　DRY 原則が破られやすい状況もあります。たとえば、コレクションを使う場合がそうです。コレクションの要素に順にアクセスするというクエリを実装する際には、同じクエリを個々の要素に対して順に実行する、というコードを書いてしまいがちなのです。

```java
public class UsageExample {
    private ArrayList<Customer> allCustomers = new ArrayList<Customer>();
    // ...
    public ArrayList<Customer> findCustomersThatSpendAtLeast(Money amount) {
        ArrayList<Customer> customersOfInterest = new ArrayList<Customer>();
        for (Customer customer: allCustomers) {
            if (customer.spendsAtLeast(amount))
                customersOfInterest.add(customer);
        }
        return customersOfInterest;
    }
}
```

　また、コレクションにクライアントが直接アクセスしてしまうと、カプセル化を壊すことになります。これはリファクタリングの可能性を狭めるだけでなく、このコードを利用する人に DRY 原則を破ることを強いてしまいます。同じクエリを逐一実装しなくてはならないからです。このような事態は、コレクションへの直接アクセスをやめれば、簡単に防ぐことができます。上記の場合は、たとえば `CustomerList` というドメイン固有のコレクション型を作成して、それを使うようにすればいいでしょう。元々存在するコレクション型に比べて、対象領域（ドメイン）の状況に適合し、クエリでアクセスするにも便利なものにすればいいのです。

　このような新たなコレクション型があれば、クエリがボトルネックになっているかどうかもすぐにわかります。クエリをコレクション型のクラスに組み込んでおけば、`ArrayList` などにクライアントが直接アクセスするといった方法は採らずに済みます。そうすれば、クライアントに影響を与えることなく、実装に変更を加えることもできるようになります。

```java
public class CustomerList {
    private ArrayList<Customer> customers = new ArrayList<Customer>();
    private SortedList<Customer> customersSortedBySpendingLevel =
        new SortedList<Customer>();
    // ...
    public CustomerList findCustomersThatSpendAtLeast(Money amoun) {
        return new CustomerList(
            customersSortedBySpendingLevel.elementsLargerThan(amount));
    }
}
public class UsageExample {
    public static void main(String[] args){
        CustomerList customers = new CustomerList();
        // ...
        CustomerList customersOfInterest =
            customers.findCustomersThatSpendAtLeast(someMinimalAmount);
        // ...
    }
}
```

　上の例では、DRY 原則を守ることで、顧客の支出金額のレベルをキーとする `SortedList` を利用して、新たなインデックススキームが導入できました。しかしそれよりも重要なことは、DRY 原則を守ることで、パフォーマンスのボトルネックの発見と解消が、WET なコードの場合より容易になっているということです。
