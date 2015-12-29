# 变量绑定（Variable Bindings）

几乎每个程序的基本能力是存储和修改数据。
Rust也不例外。
让我们以一个简单示例开始。

## 绑定（binding）的基础知识

首先，我们将使用Cargo生成一个新的项目。
打开终端，并定位到你想保存项目的目录。在那里，让我们生成一个新的项目:

```bash
$ cargo new --bin bindings
$ cd bindings
```

这会创建一个新的项目，'bindings'，并且会建立我们的`Cargo.toml`和`src/main.rs`文件。
我们在"Hello, World!"章节中见过，Cargo会生成这些文件，并且为我们创建一个‘hello world’程序:

```rust
fn main() {
    println!("Hello, world!");
}
```

让我们用这个程序覆盖上面那个:

```rust
fn main() {
    let x = 5;

    println!("The value of x is: {}", x);
}
```

并运行它:

```bash
$ cargo run
   Compiling bindings v0.1.0 (file:///home/steve/tmp/bindings)
     Running `target/debug/bindings`
The value of x is: 5
```

如果你看到的是错误信息，请仔细检查你有没有复制正确上面的代码。
让我们一行一行来解读。

```rust,ignore
fn main() {
```
`main()`函数是每个Rust程序的入口。
我们在下节会讲更多关于函数（function）的内容，但是现在，我们只需要知道程序从哪里开始就够了。
开头的大括号`{`，表示函数体的开始。

```rust,ignore
    let x = 5;
```

这是我们第一个‘变量绑定’，它是我们用‘`let`语句（statement）’创建的。

这个`let`语句格式是这样的:

```text
let NAME = EXPRESSION;
```
一个`let`语句首先会对`EXPRESSION`进行求值，然后把结果值绑定给`NAME`，以便它能在后面的程序中被引用。
在我们这个简单示例中，表达式已经是一个值了，是5，但是我们能实现相同的效果:

```rust
let x = 2 + 3;
```

一般情况下，`let`语句跟模式（pattern）一起工作，变量名只是模式的一种简单形式。
模式，是Rust的重要组成部分，我们将在后面看到更复杂更强大的模式。

在这样做之前，我们先来把这个例子的剩余部分弄清楚。
来看下一行:

```rust,ignore
    println!("The value of x is: {}", x);
```
`println!`宏在屏幕上打印文本。
我们可以告诉大家，这是一个宏，因为那个`!`。
我们不会学习如何编写宏，你将在本书的后面学到，但是我们会用到由整个标准库提供的宏。
每次你看到`!`，请记住，这意味着一个宏。
宏可以为语言增加新的语法，并且`!`意味着提醒某件事非比寻常。

`println!`，具体来说，有一个必须的参数，‘格式字符串（format string）’，以及任意个数的可选参数。
格式字符串可以包含特殊的文本`{}`。
每个`{}`都对应一个额外的参数。这里有一个例子:

```rust
let x = 2 + 3;
let y = x + 5;
println!("The value of x is {}, and the value of y is {}", x, y);
```

你可以想象`{}`是一个固定了值的小蟹钳。
这样的占位符有很多高级的格式选项，我们将在后面讨论。

```rust,ignore
}
```

最后，一个闭合大括号匹配了该`main()`函数声明的起始大括号，函数声明结束。

对于输出:

```text
The value of x is: 5
```

我们将`5`绑定给`x`，然后用`println!`将其打印到屏幕上。

We assign `5` to a binding, `x`, and then print it to the screen with `println!`.

## 多个绑定

让我们尝试一个更复杂的模式。
对我们的示例做如下改变:

```rust
fn main() {
    let (x, y) = (5, 6);

    println!("The value of x is: {}", x);
    println!("The value of y is: {}", y);
}
```

使用`cargo run`运行它:

```text
$ cargo run
   Compiling bindings v0.1.0 (file:///home/steve/tmp/bindings)
     Running `target/debug/bindings`
The value of x is: 5
The value of y is: 6
```
我们用一个`let`创建了两个绑定！
这里是我们的模式:

```text
(x, y)
```

这是值:

```text
(5, 6)
```

如你所见，上面的两行是让`x`绑定`5`，`y`绑定`6`。
我们也能用两个`let`语句:

```rust
fn main() {
    let x = 5;
    let y = 6;
}
```

对于像这样简单的情况来说，两个`let`也许更清晰，但是其他情况，一次创建多个绑定也许更好。
当我们变得越来越精通Rust，我们就会找出哪种风格更好，但是它最多是个主观判断。

## 类型注解（type annotation）

你可能已经注意到了，在前一个例子中，我们并没有声明`x`或`y`的类型。
Rust是一个 *静态类型（statically typed）*语言，也就是说，在编译时，我们必须知道所有绑定的类型。
但是注解每一个绑定的类型是个繁杂的工作，并且会让代码变的嘈杂。
为了解决这个问题，Rust使用了‘类型推导（type inference）’，即，它会尝试推断绑定的类型。

类型推导的主要方式是通过查看它是如何被用的。
让我们再次查看示例:

```rust
fn main() {
    let x = 5;
}
```

当我们把`5`绑定给`x`的时候，编译器知道`x`应该是一个数值类型。
在没有其他任何信息的情况下，它默认是`i32`类型，32位整数类型。
我们将在3.3节讨论更多关于Rust的基本类型。

下面是使用了`类型注解`的`let`语句示例:

```rust
fn main() {
    let x: i32 = 5;
}
```

我们可以添加一个冒号，然后是类型名称。
这里是使用了类型注解的`let`语句结构:


```text
let PATTERN: TYPE = VALUE;
```

注意，冒号和`TYPE`在`PATTERN`后面。
这里有使用了两个绑定的复杂模式:

```rust
fn main() {
    let (x, y): (i32, i32) = (5, 6);
}
```

就像我们用`PATTERN`匹配`VALUE`那样，我们也用`PATTERN`匹配`TYPE`。

## 延迟初始化（Delayed Initialization）

绑定的初始值不是必须提供的，我们可以在之后再把值指派给它。试试这段代码:

```rust
fn main() {
    let x;

    x = 5;

    println!("The value of x is: {}", x);
}
```

使用`cargo run`执行:

```text
$ cargo run
   Compiling bindings v0.1.0 (file:///home/steve/tmp/bindings)
     Running `target/debug/bindings`
The value of x is: 5
```

执行的很顺利。
这就是引出一个问题: 如果我们在声明一个值之前尝试打印绑定会怎么样？
下面是演示此问题的代码:

```rust,ignore
fn main() {
    let x;

    println!("The value of x is: {}", x);

    x = 5;
}
```

我们可以通过执行`cargo run`找出答案:

```text
   Compiling bindings v0.1.0 (file:///home/steve/tmp/bindings)
src/main.rs:4:39: 4:40 error: use of possibly uninitialized variable: `x` [E0381]
src/main.rs:4     println!(“The value of x is: {}”, x);
                                                    ^
<std macros>:2:25: 2:56 note: in this expansion of format_args!
<std macros>:3:1: 3:54 note: in this expansion of print! (defined in <std macros>)
src/main.rs:4:5: 4:42 note: in this expansion of println! (defined in <std macros>)
src/main.rs:4:39: 4:40 help: run `rustc --explain E0381` to see a detailed explanation
error: aborting due to previous error
Could not compile `bindings`.

To learn more, run the command again with --verbose.
```

一个错误！
编译器不让我们这样去写程序。
这是编译器帮助我们在程序中发现错误的第一个示例。
不同的程序语言对这个问题的处理方法不同。
有些语言总是会初始化某种默认值。
另外一些语言会留着未初始化的值，而不保证你在初始化它之前用到它的时候会出现什么么蛾子。
Rust选择了另外一种: 抛出错误，并且强制要求程序员去说清楚他们到底想做什么。
我们在用`x`之前，必须初始化某种值。

### 扩展错误解释

这有关于错误消息更有趣的部分:

```text
src/main.rs:4:39: 4:40 help: run `rustc --explain E0381` to see a detailed explanation
```
我们通过给`rustc`传入`--explain`就能看到扩展的错误解释。
并不是每个错误都有更详细的解释，但是大部分是如此。
这些扩展的解释试图展示错误发生的常见原因，以及问题的常见解决方案。

下面是`E0381`:

```bash
$ rustc --explain E0381
It is not allowed to use or capture an uninitialized variable. For example:

fn main() {
    let x: i32;
    let y = x; // error, use of possibly uninitialized variable

To fix this, ensure that any declared variables are initialized before being
used.
```

如果你对某个错误束手无策的话，这些解释可以帮到你。
编译器是你的朋友，并为你提供帮助。

## 可变绑定

改变绑定的值会怎么样？ 这里有另外一个示例展示了这个问题:

```rust,ignore
fn main() {
    let x = 5;

    x = 6;

    println!("The value of x is: {}", x);
}
```

`cargo run`为我们给出了答案:

```bash
$ cargo run
   Compiling bindings v0.1.0 (file:///home/steve/tmp/bindings)
src/main.rs:4:5: 4:10 error: re-assignment of immutable variable `x` [E0384]
src/main.rs:4     x = 6;
                  ^~~~~
src/main.rs:4:5: 4:10 help: run `rustc --explain E0384` to see a detailed explanation
src/main.rs:2:9: 2:10 note: prior assignment occurs here
src/main.rs:2     let x = 5;
                      ^
```

错误里提到`re-assigment of immutable variable`（重新指派不可变变量）
这是对的: 绑定是不可变的.
但是仅仅是指它们默认不可变。
当我们创建新绑定的时候，我们可以在模式（译注：x = 5，叫模式）前面增加`mut`来把绑定变成可变的。
这有个例子:

```rust
fn main() {
    let mut x = 5;

    println!("The value of x is: {}", x);

    x = 6;

    println!("The value of x is: {}", x);
}
```

运行它:

```bash
$ cargo run
   Compiling bindings v0.1.0 (file:///home/steve/tmp/bindings)
     Running `target/debug/bindings`
The value of x is: 5
The value of x is: 6
```

我们现在可以改变`x`绑定的值了。
注意该语法`let mut`不是一体的，而是在模式前使用了`mut`
对模式使用`()`更明显:

```rust,ignore
fn main() {
    let (mut x, y) = (5, 6);

    x = 7;
    y = 8;
}
```

编译器会对这段程序发牢骚:

```bash
$ cargo build
   Compiling bindings v0.1.0 (file:///home/steve/tmp/bindings)
src/main.rs:5:5: 5:10 error: re-assignment of immutable variable `y` [E0384]
src/main.rs:5     y = 8;
                  ^~~~~
src/main.rs:5:5: 5:10 help: run `rustc --explain E0384` to see a detailed explanation
src/main.rs:2:17: 2:18 note: prior assignment occurs here
src/main.rs:2     let (mut x, y) = (5, 6);
                              ^
```

重新指派`x`是可以的，但是`y`却不行。
`mut`仅对就近的绑定起作用，而不是整个模式。

### 重新指派，而不是变化

还有个细微之处，我们还没有讨论过: `mut`允许你去改变_绑定_，而不是改变_绑定的值_。
换句话说:

```rust
fn main() {
    let mut x = 5;

    x = 6;
}
```

这不会改变`x`绑定的值，而是创建了一个新值，`6`，然后让`x`绑定了新值。
这是一个微妙但很重要的区别。
现在并没有太大差别，但是当我们的程序变得更复杂的时候，差异就会明显。
特别是，当给函数传递参数的时候，差异将显现。
我们将在下一节讨论函数的时候来探讨这种差别。

## 作用域（scope）

变量绑定有其生效的‘作用域’。
作用域起始于绑定的声明，结束于下一个代码块。
我们仅能在‘作用域中’访问到绑定。
在“进入作用域之前”和“离开作用域之后”都不能访问绑定。
这里是一个示例:

```rust
fn main() {
    println!("x is not yet in scope");

    let x = 5;
    println!("x is now in scope");

    println!("In real code, we’d now do a bunch of work.");

    println!("x will go out of scope now! The next curly brace is ending the main function.");
}
```

我们可以通过使用`{`和`}`创建任意作用域:

```rust
fn main() {
    println!("x is not yet in scope");

    let x = 5;
    println!("x is now in scope");

    println!("Let’s start a new scope!");

    {
        let y = 5;
        println!("y is now in scope");
        println!("x is also still in scope");

        println!("y will go out of scope now!");
        println!("The next curly brace is ending the scope we started.");
    }

    println!("x is still in scope, but y is now out of scope and is not usable");

    println!("x will go out of scope now! The next curly brace is ending the main function.");
}
```

一旦我们学习了关于`引用（reference）`和`特质（trait）`之后，绑定是在作用域内还是作用域外，将会变的更加重要。

## 绑定屏蔽（Shadowing）

关于绑定的最后一件事是: 它们可以用相同的名称‘屏蔽（shadow）’前一个绑定。
这里是一个简单示例:

```rust
fn main() {
    let x = 5;
    let x = 6;

    println!("The value of x is: {}", x);
}  
```

运行它，我们能看到屏蔽起作用了:

```text
src/main.rs:2:9: 2:10 warning: unused variable: `x`, #[warn(unused_variables)] on by default
src/main.rs:2     let x = 5;
                      ^
     Running `target/debug/bindings`
The value of x is: 6
```

在此输出中有两件有意思的事。
首先，Rust能编译并运行这段程序，没有问题。
其次，如我们所见，`x`的值是`6`。
但是，我们没有把`x`声明为可变绑定。
而是声明了一个_新_的绑定，也把它命名为`x`，然后指派给它一个新值。
只要新的`x`被声明，旧的`x`绑定的值就无法被访问了。
如果你想改变一个值，但是又想让它不可变，那可以用绑定屏蔽。
比如:

```rust
fn main() {
    let x = 5;
    let x = x + 1;
    let x = x * 2;

    println!("The value of x is: {}", x);
}
```

将会输出:

```bash
   Compiling bindings v0.1.0 (file:///home/steve/tmp/bindings)
     Running `target/debug/bindings`
The value of x is: 12
```

这让我们修改`x`，但没有把绑定改成可变的。
这样做是有好处的，因为后面如果我们修改它的话，编译器会提示我们的。
假设我们计算出`12`以后，还想修改`x`。
如果没把程序改成可变绑定的风格，大概是这样:

```
fn main() {
    let mut x = 5;
    x = x + 1;
    x = x * 2;

    println!("The value of x is: {}", x);

    x = 15;

    println!("The value of x is: {}", x);
}
```
Rust很乐意让我们再次修改它为`15`。
把上面程序改成不可变风格以后，再去修改`x`:

```rust,ignore
fn main() {
    let x = 5;
    let x = x + 1;
    let x = x * 2;

    println!("The value of x is: {}", x);

    x = 15;

    println!("The value of x is: {}", x);
}
```

如果我们尝试编译，会得到下面错误:

```bash
$ cargo build
   Compiling bindings v0.1.0 (file:///home/steve/tmp/bindings)
src/main.rs:8:5: 8:11 error: re-assignment of immutable variable `x` [E0384]
src/main.rs:8     x = 15;
                  ^~~~~~
src/main.rs:8:5: 8:11 help: run `rustc --explain E0384` to see a detailed explanation
src/main.rs:4:9: 4:10 note: prior assignment occurs here
src/main.rs:4     let x = x * 2;
                      ^
error: aborting due to previous error
Could not compile `bindings`.
```

正是我们想要的。

绑定屏蔽可能需要一些时间来适应，但是它非常强大，并且可以和不可变风格的代码很配。

我们讨论一下关于在本节最初那个程序编译输出的问题。
这是其中一部分:

```text
src/main.rs:2:9: 2:10 warning: unused variable: `x`, #[warn(unused_variables)] on by default
```

下面是两行相关的代码:

```rust
let x = 5;
let x = 6;
```

Rust知道我们屏蔽了绑定`x`，但是我们从始至终都没有用到过初始值。
这不是个错误，确切来说，它可能不是我们想要的结果。
在这种情况下，编译器发出了一个‘警告’，但是仍然会编译我们的程序。
`#[warn(unused_variables)]` 语法被叫做‘属性（attribute）’，我们将在后面的章节讨论。
更具体来讲，这样的警告被称为'lint'，它是一个古老术语，是对那些你不想编入布里的羊毛的称呼。
代码里这行lint很相似，它告诉我们，这里可能有一些并不需要的多余代码。
没有它，我们的代码也会工作的很好。
这些警告值得注意，并要根据它们的提示修复这些问题。
因为它们可能是某种严重问题的信号。
在本例中，我可能没有意识到我们已经屏蔽了绑定`x`。

### 绑定屏蔽和作用域

跟任意绑定一样，一个绑定屏蔽另外一个绑定也是只在作用域内有效。
这里是示例代码:

```rust
fn main() {
    let x = 5;

    println!("Before shadowing, x is: {}", x);

    {
        let x = 6;

        println!("Now that x is shadowed, x is: {}", x);
    }

    println!("After shadowing, x is: {}", x);
}
```
如果我们运行这个程序，我们能看到“屏蔽绑定”的变化:

```bash
$ cargo run
   Compiling bindings v0.1.0 (file:///home/steve/tmp/bindings)
     Running `target/debug/bindings`
Before shadowing, x is: 5
Now that x is shadowed, x is: 6
After shadowing, x is: 5
```
