# Hello, world!

<<<<<<< HEAD
现在，你已经安装了Rust，让我们开始写第一个Rust程序。
在学习新语言的时候，有一个传统，就是写一个小程序来打印“hello，world！”，在本节，我们将遵循这一传统。
=======
Now that you have Rust installed, let’s write your first Rust program. It's
traditional when learning a new language to write a little program to print the
text “Hello, world!” to the screen, and in this section, we'll follow that
tradition.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

以这样一个简单程序开始的一个好处就是，你可以快速验证编译器是安装好并能正常工作的。
在屏幕上打印信息也是很常见的，所以尽早练习也是件好事。

> 注: 本书假设读者已熟悉命令行。
> Rust本身并没有具体要求你使用哪种工具、编辑器，所以如果你喜欢用IDE，那也是可以的。


## 创建项目文件

首先，创建一个文件来写Rust代码。Rust并不关心你的代码在哪，但是对于本书来说，
我的建议是在你的home目录下创建一个 *projects* 目录，并且把所有的项目都放在里面。
打开终端并且输入下列命令来为这个特别的项目来创建一个目录:

```bash
$ mkdir ~/projects
$ cd ~/projects
$ mkdir hello_world
$ cd hello_world
```

> 注：如果你是在Windows下，并且没有使用PowerShell，那么`~`将不会工作。
> 请自行翻阅关于shell更详细的文档。

## 写一个Rust程序并运行

接下来，创建一个新的源文件，命名为 *main.rs* 。Rust文件总是以 *.rs* 扩展名结尾。
如果你的文件名需要以多个单词命名，那么你最好用下划线来分隔这两个单词，
比如，使用 *hello_world.rs* 来代替 *helloworld.rs*。


现在，打开你刚刚创建好的 *main.rs* 文件，并且输入下面代码:

```rust
fn main() {
    println!("Hello, world!");
}
```

保存这个文件，并且返回到终端窗口。在Linux或Mac下，可以输入下面命令:

```bash
$ rustc main.rs
$ ./main
Hello, world!
```

<<<<<<< HEAD
对于Windows来说，只需要把`main`换成`main.exe`。
不管你用哪种操作系统，你应该会看见终端输出Hello，world！字符串。
如果你完成了上述示例，那么恭喜你！
你已经正式写了一个Rust程序，你已经成为一名Rust程序员了！欢迎。
=======
In Windows, just replace `main` with `main.exe`. Regardless of your operating
system, you should see the string `Hello, world!` print to the terminal. If you
did, then congratulations! You've officially written a Rust program. That makes
you a Rust programmer! Welcome.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

## Rust程序剖析

现在，让我们来了解一下刚才“Hello，world！”程序的细节。下面是第一部分:

```rust
fn main() {

}
```

该行代码定义了一个Rust函数。main函数比较特殊：它是每个Rust程序的起点。
第一行的意思是，“我定义来一个名为main的函数，没有参数，也没有返回任何值”。
如果这里有参数，那参数将会放在括号(`(` 和 `)`)内，并且因为我们没有从该函数中返回任何值，
我们可以完全忽略返回类型。

也要注意，该函数体是被包裹在大括号 (`{` 和 `}`)中的。
Rust要求所有的函数体都必须如此，一个比较好的风格，就是把大括号跟函数声明放在同一行，两者之间隔一个空格。


在`main()`函数内部:

```rust
    println!("Hello, world!");
```

<<<<<<< HEAD
该行代码在这个小程序中的作用就是： 在屏幕上打印文本。
这里有许多重要的细节，首先，这里（println前面）有四个空格，而非制表符。

第二个重要的部分就是`println!()`这行。它实际上是调用了一个 *[Rust宏]（macro）* ，宏是用来实现Rust元编程的。如果直接调用函数而不是宏，则可以写成这样：`println()`（注意，这里没有”!”）。
我们将在之后讨论Rust宏的更多细节，但是现在你只需要知道，当你看到“叹号（!）”的时候，意味着你调用的是宏，
而非普通函数。
=======
This line does all of the work in this little program: it prints text to the
screen. There are a number of details that are important here. The first is
that it’s indented with four spaces, not tabs.

The second important part is the `println!()` line. This is calling a Rust
*[macro]*, which is how metaprogramming is done in Rust. If it were calling a
function instead, it would look like this: `println()` (without the !). We'll
discuss Rust macros in more detail later, but for now you just need to
know that when you see a `!` that means that you’re calling a macro instead of
a normal function.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

[Rust宏]: macros.html

接下来是“Hello，World！”这个 *字符串* 。
我们把该字符串传作为参数传给`println!`，此宏负责把字符串打印到屏幕上。就是这么简单！

整行代码以分号（`;`）结尾。Rust是一个 *表达式导向（expression oriented ）* 的语言，即Rust里大部分东西都是表达式(expression)，而非语句（statement）。
`;`表示这个表达式已经结束，并且下一个准备开始。Rust代码中大多数都是以分号(`;`)结尾。

## 编译和运行是独立的两步

<<<<<<< HEAD
在“写一个Rust程序并运行”小节，我们展示了如何运行一个新创建的程序。我们现在将打破这个过程，来研究每一个步骤。
=======
In "Writing and Running a Rust Program", we showed you how to run a newly
created program. We'll break that process down and examine each step now.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

在运行Rust程序之前，你必须编译它。你能通过输入rustc命令来使用Rust编译器，给它传入一个源文件名即可，像这样:

```bash
$ rustc main.rs
```

如果你有C或C++背景，你会注意到这和`gcc`或`clang`很相似。
在编译成功以后，Rust应该会输出一个二进制可执行文件，在Linux或Mac上，你可以通过ls命令来查看，如下所示:

```bash
$ ls
main  main.rs
```

在Windows上，你输入:

```bash
$ dir
main.exe  main.rs
```

这些命令会显示两个文件：使用`.rs`扩展名的源码文件和可执行文件(Windows上是`main.exe`，其他是`main`)。
剩下的事情就是运行`mian`或`main.exe`文件了，像这样:

```bash
$ ./main  # or main.exe on Windows
```
如果 *main.rs* 是你的“Hello，World！”程序，它将会在你的终端打印“Hello，World！”。

如果你有动态语言的背景，比如用Ruby、Python或JavaScript这些语言，你可能不需要把编译和运行分成独立的两步去做。
Rust是 *预编译* 语言，也就是说，只要你编译了这个程序，然后把它随便给一个人，他都可以直接运行该程序而不需要安装Rust。
如果你给一个人.rb或.py或.js文件，他们需要分别安装Ruby、Python和JavaScript，但是只需要一个命令就能完成编译和运行该程序。
一切都在于语言设计的权衡。

对于简单的程序来说，只需要用rustc编译就好了，但是当你的项目的增长，你会希望能够管理你项目中所有的选项，
并且可以把它容易的共享给其他人和项目。接下来，我将介绍一个叫做Cargo的工具，它用来帮助我们去写真实世界的Rust程序。

# Hello, Cargo!

Cargo是Rust的构建（build）系统和包管理器，Rustacean们用Cargo去管理他们的Rust项目。
Cargo管理三件事：构建你的代码、下载你代码依赖的库，以及构建这些库。
我们调用你代码需要“依赖（dependencies）”的库，因为你的代码依赖于它们。

最简单的Rsut程序没有任何依赖，所以现在，你只使用了其功能的第一部分。
当你编写更复杂的Rust程序的时候，你就会添加依赖，如果你使用了Cargo，这一切将会更容易去做。

绝大多数的Rust项目都用Cargo，我们将在本书余下的部分都使用它。如果你用了官方的安装程序，
Cargo是连同Rust一起被安装的。如果你通过其他途径安装Rust，你可以通过在终端输入下面命令来检查Cargo是否被安装:

```bash
$ cargo --version
```

如果你能看到版本号，那是极好的！如果你看到了像“`command not found`”这样的错误，
那么你应该看看你安装Rust的那个文档，确定下Cargo是不是分开安装的。


## 开始使用Cargo


<<<<<<< HEAD
让我们把那个Hello World程序换成Cargo的。想Cargo化一个项目，你需要做三件事：
=======
Let’s convert the Hello World program to Cargo. To Cargo-fy a project, you need
to do three things:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

1. 把你的源文件放到正确的目录下。
2. 摆脱旧的可执行文件（Windows上的main.exe，其他是main），并且生成一个新的。
3. 创建一个Cargo配置文件。

让我们开始吧！

### 创建一个新的可执行文件和源目录

首先，打开你的终端，进入hello_world目录，然后输入下面命令:

```bash
$ mkdir src
$ mv main.rs src/main.rs
$ rm main  # or 'del main.exe' on Windows
```

<<<<<<< HEAD
Cargo期望你的源文件待在 *src* 目录里，所以你先得完成这一步。
留在顶级项目目录（在本例中是 *hello_world* 根目录）中的文件是READMEs、license信息和其他完全和代码无关的文件。
这样一来，使用Cargo可以帮助你保持项目的美丽和整洁。
人神各有层天，各归其位！（There's a place for everything, and everything is in its place.）。
=======
Cargo expects your source files to live inside a *src* directory, so do that
first. This leaves the top-level project directory (in this case,
*hello_world*) for READMEs, license information, and anything else not related
to your code. In this way, using Cargo helps you keep your projects nice and
tidy. There's a place for everything, and everything is in its place.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a


<<<<<<< HEAD
现在，把 *main.rs* 文件复制到 *src* 目录中，并且删除你用rustc创建的已编译文件。
跟之前一样，如果你用了Windows，那么就是删除`main.exe`，其他操作系统是`main`。
=======
This example retains `main.rs` as the source filename because it's creating an
executable. If you wanted to make a library instead, you'd name the file
`lib.rs`. This convention is used by Cargo to successfully compile your
projects, but it can be overridden if you wish.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

该示例保留了`main.rs`做为源文件名，因为它创建了可执行文件。
如果你想生成一个库，你需要把文件命名为`lib.rs`。
Cargo使用这个约定来使编译成功，但是如果你愿意的话也可以重写约定。

### 创建配置文件

<<<<<<< HEAD
接下来，在你的 *hello_world* 目录中创建一个新的文件，命名为Cargo.toml。
=======
Make sure to capitalize the `C` in `Cargo.toml`, or Cargo won't know what to do
with the configuration file.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

确保Cargo.toml文件名的首字母C是大写，否则Cargo将忽略掉配置文件。

该文件是 *[TOML]*（Tom’s Obvious,Minimal Language，译者本身也[翻译了TOML的文档]，但是pull request一直没被merge，感兴趣的可以去看）格式的。TOML类似于INI，但是有一些其他优点，它被用来作为Cargo的配置文件格式。

[TOML]: https://github.com/toml-lang/toml
[翻译了TOML的文档]: https://github.com/RustStudy/toml

在该文件中，输入以下信息:

```toml
[package]

name = "hello_world"
version = "0.0.1"
authors = [ "Your name <you@example.com>" ]
```

第一行，`[package]`，表明下面的语句是配置一个包。
当我们在该文件中添加更多信息的时候，我们将添加其他片段，但是现在，我们只有包配置信息片段。

剩下的三行设置了Cargo编译程序时候需要的三部分配置信息：它的名字、它的版本号和它的作者。

一旦你将这些信息添加到 *Cargo.toml* 文件中并保存之后，那么配置文件也就创建完成了。

## 构建并运行一个Cargo项目

<<<<<<< HEAD
=======
## Building and Running a Cargo Project
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

通过项目根目录下的 *Cargo.toml* 文件，你应该可以构建并运行你的Hello World程序了！输入下列命令来完成它:

```bash
$ cargo build
   Compiling hello_world v0.0.1 (file:///home/yourname/projects/hello_world)
$ ./target/debug/hello_world
Hello, world!
```

<<<<<<< HEAD
如果一切顺利，你将在终端再次看到`Hello，world！`
=======
Bam! If all goes well, `Hello, world!` should print to the terminal once more.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

你刚才是用`cargo build`构建了一个项目，并且使用了`./target/debug/hello_world`运行了它，
但是你实际上可以使用`cargo run`命令一步完成那两个动作，如下所示:

```bash
$ cargo run
     Running `target/debug/hello_world`
Hello, world!
```

注意，这个例子并不是重新构建此项目。Cargo发现该文件并没有被改变，所以它只是运行了二进制可执行文件。
如果你修改了你的源代码，Cargo会重写构建项目再运行，你可以会看到类似这样的输出:

```bash
$ cargo run
   Compiling hello_world v0.0.1 (file:///home/yourname/projects/hello_world)
     Running `target/debug/hello_world`
Hello, world!
```

Cargo知道你项目文件中任何修改，如果最新一次build之后文件有所改变，那么Cargo将会重新构建项目。


<<<<<<< HEAD
对于简单项目来说，Cargo并没有使用到它的诸多功能而只是用了`rustc`，但是它在以后会非常有用。
对于复杂的项目，用Cargo来协调构建过程会使一切变得更简单。
用Cargo，你可以只运行`cargo build`，也是它的正确工作方式。
=======
With simple projects, Cargo doesn't bring a whole lot over just using `rustc`,
but it will become useful in the future. With complex projects composed of multiple
crates, it’s much easier to let Cargo coordinate the build. With Cargo, you can
just run `cargo build`, and it should work the right way.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

## 构建发行版



当你的项目最终做好了发行的准备，你可以用`cargo build —release`命令来优化编译你的项目。
这些优化会使你的Rust代码运行的更快，但是换来的代价是你的程序会编译的更慢。
这就是为什么有两个不同的配置文件，一个是为了开发，另一个用于构建你分发给用户的最终版本。

运行该命令也会让Cargo创建一个新的文件，叫 *Cargo.lock*，看起来像这样:

```toml
[root]
name = "hello_world"
version = "0.0.1"
```

Cargo使用 *Cargo.lock* 文件来记录你应用中的依赖。
这是Hello World项目中的 *Cargo.lock* 文件。
该项目没有任何依赖，所以该文件有点单薄。实际上，你永远不需要亲自接触这个文件，只需要交给Cargo处理就行了。

<<<<<<< HEAD
如果你是从头到尾跟着做的话，你现在应该已经成功使用Cargo构建了hello_world。
=======
That’s it! If you've been following along, you should have successfully built
`hello_world` with Cargo.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

尽管该项目很简单，但是它多少也是使用了你以后Rust职业生涯中会用到的真正工具。事实上，你可以认为实际上所有的Rust项目都是使用下面命令的变种:

```bash
$ git clone someurl.com/foo
$ cd foo
$ cargo build
```

## 创建新的Cargo项目最简单的方式


这是你每次开始一个新项目之前必须要做的过程。Cargo可以快速的生成一个基础项目目录，让你能保持正确的开发姿势。

用Cargo创建新的项目，只需要键入`cargo new`命令:

```bash
$ cargo new hello_world --bin
```

该命令传入`--bin`，是因为我们的目的是直接获取可执行的应用程序，而非一个库。
可执行文件通常被叫做 *二进制文件*（如果你用了Unix系统，这类文件在/usr/bin目录中）。

Cargo为我们生成了两个文件和一个目录：*Cargo.toml* 和 *src* 目录，以及 *src* 中的 *main.rs* 文件。
这应该很熟悉了吧，我们在上面的内容中手工创建过。

这便是你开始项目所需要的东西。首先，打开 *Cargo.toml*。应该能看到跟下面类似的内容:

```toml
[package]

name = "hello_world"
version = "0.1.0"
authors = ["Your Name <you@example.com>"]
```

Cargo已经根据你给的参数和你的`git`全局配置自动填充了合适的内容。
你可能也注意到了，Cargo已经把`hello_world`目录初始化为了`git`仓库。

在`src/main.rs`中应该能看到如下内容:

```rust
fn main() {
    println!("Hello, world!");
}
```

<<<<<<< HEAD
Cargo已经为你生成了“hello world！”，你就可以开始coding了！
=======
Cargo has generated a "Hello World!" for you, and you’re ready to start coding!
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

> 注：如果你想了解Cargo更详细的内容，可以去翻阅官方的[Cargo guide]，那里覆盖了它所有的特性。

[Cargo guide]: http://doc.crates.io/guide.html
