# 安装

使用Rust的第一步是先安装它。一般来说，你只要连上互联网就能运行本章中的命令，我们将从互联网上下载Rust。

我将使用终端来展示一些命令，这些命令都是以`$`符号开始。我们不需要键入`$`符号，它只是为了表明这是每个命令的开始。
我们在网络上看到的许多指南和示例都是遵循这个约定的：`$`命令以普通用户身份来运行，`#`命令以管理员身份来运行。

## 在Linux或Mac上安装

如果我们使用Linux或Mac，我们需要打开终端输入下面命令:

```bash
$ curl -sSf https://static.rust-lang.org/rustup.sh | sh
```

该命令会下载一个安装脚本。如果一切OK，你会看到下面的内容:

```text
Welcome to Rust.

This script will download the Rust compiler and its package manager, Cargo, and
install them to /usr/local. You may install elsewhere by running this script
with the --prefix=<path> option.

The installer will run under ‘sudo’ and may ask you for your password. If you do
not want the script to run ‘sudo’ then pass it the --disable-sudo flag.

You may uninstall later by running /usr/local/lib/rustlib/uninstall.sh,
or by running this script again with the --uninstall flag.

Continue? (y/N)
```

看到这一行，请输入`y`或`yes`，然后会看到剩余的提示。

## 在Windows上安装

如果你用Windows，请下载对应的[安装器][install-page]。

[install-page]: https://www.rust-lang.org/install.html

## 卸载

卸载Rust跟安装它一样容易。在Linux或Mac上只需要运行卸载脚本:

```bash
$ sudo /usr/local/lib/rustlib/uninstall.sh
```

如果你用了Windows，你可以重新执行.msi，它会出现卸载的选项.

## 调试

如果我们已经安装好Rust，可以打开shell，输入下面命令:

```bash
$ rustc --version
```

你将看到版本号、commit hash和该版本的提交日期。

如果你执行了该命令，并看到了上面信息，那么恭喜你，Rust已经安装成功！

如果你是在windows上，并且没有得到相关信息，那么请检查Rust是否在你的 %PATH% 系统变量中。如果没有，请再次运行安装器，选择“change”页面，并且确保“Add To Path”选项被选择。

如果还不行，就去rust IRC、Stack Overflow上面去求助吧。最简单的是去
[the #rust IRC channel on irc.mozilla.org][irc], 可以通过
[Mibbit][mibbit]来访问。 点击那个链接，我们就可以和其他的Rustacean
(这是我们rust程序员为自己起的蠢萌的昵称)们 聊天。另外一些比较好的资源也包括 [the user’s forum][users]和 [Stack Overflow][stackoverflow].

[irc]: irc://irc.mozilla.org/#rust
[mibbit]: http://chat.mibbit.com/?server=irc.mozilla.org&channel=%23rust
[users]: https://users.rust-lang.org/
[stackoverflow]: http://stackoverflow.com/questions/tagged/rust

## 本地文档

上面的安装过程也会在本地复制一份文档，所以我们可以离线阅读它。对于UNIX系统，文档在/usr/local/share/doc/rust下面。对于Windows，文档在share/doc目录下对应的Rust目录中。
