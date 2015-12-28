# Rust编程语言（The Rust Programming Language）

这是"Rust编程语言（The Rust Programming Language）"的下一次迭代版本，位于当前[Rust的主仓库中][src]。
如果你想读本书，你可以直接在这里或者是去[官网][prod]查看。

[src]: https://github.com/rust-lang/rust/tree/master/src/doc/book
[prod]: https://doc.rust-lang.org/book/

如果你想看当前这个版本，可以打开[GitHub pages][html].

[html]: http://rust-lang.github.io/book/

## 要求

构建本书需要用到 [mdBook]:

[mdBook]: https://github.com/azerupi/mdBook

```bash
$ cargo install mdbook
```

## 构建

要构建本书，只需输入:

```bash
$ make
```

所有生成的页面都会被放到`book`子目录下。使用你的浏览器就可阅读：

```bash
$ firefox book/index.html
```

运行测试:

```bash
$ make test
```

也可以直接使用下面的命令进行构建和测试:

```bash
$ make all
```

## Contributing

I’m not going to be accepting major changes at first, but pull requests to fix
typos and such are welcome. Please file any issues for any bugs you find, and
utilize the issue tagged with `Discussion` to raise any larger questions /
feedback.

This repository is under the same license as Rust itself, MIT/Apache2.

There are a number of labels on Issues:

* `Discussion` issues are for discussing the chapters. There’s an issue per
  section.
* `Bug` issues indicate problems in the text.
* `Needs Backport` will be used when we are further along. At some point, we
  will import the text into their review system, and so changes made here will
  need to be upstreamed. This will track those.

Finally, there’s the `S-` labels, which are for various ‘status’es:

* `S-initial`: Steve has not done any work here yet.
* `S-rough-draft`: Steve has worked up a rough draft of what this section will
  look like.
* `S-under-review`: Aaron and Steve are in the process of reviewing this
  section.
* `S-done`: imported into No Starch’s system. There may still be changes based
  on their feedback, even after a section is marked `S-done`.
