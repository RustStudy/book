# 变量绑定（Variable Bindings）

<<<<<<< HEAD
几乎每个程序的基本能力是存储和修改数据。
Rust也不例外。
让我们以一个简单示例开始。
=======
The foundation of virtually every program is the ability to store and modify
data. Rust programs are no different. Let’s start with a short example.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

## 绑定（binding）的基础知识

<<<<<<< HEAD
首先，我们将使用Cargo生成一个新的项目。
打开终端，并定位到你想保存项目的目录。在那里，让我们生成一个新的项目:
=======
First, we’ll generate a new project with Cargo. Open a terminal, and navigate
to the directory where you’d like to keep your projects. From there, let’s
generate a new project:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```bash
$ cargo new --bin bindings
$ cd bindings
```

<<<<<<< HEAD
这会创建一个新的项目，'bindings'，并且会建立`Cargo.toml`和`src/main.rs`文件。
我们在"Hello, World!"章节中见过，Cargo会生成这些文件，并且创建一个‘hello world’程序:
=======
This creates a new project, ‘bindings’, and sets up our `Cargo.toml` and
`src/main.rs` files. As we saw in “Hello, World!”, Cargo will generate these
files and create a little ‘hello world’ program for us:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

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

<<<<<<< HEAD
如果你看到的是错误信息，请仔细检查你有没有复制正确上面的代码。
让我们一行一行来解读。
=======
If you see an error instead, double check that you have copied the program
exactly as written. Let’s break this down, line by line.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
fn main() {
```
<<<<<<< HEAD
`main()`函数是每个Rust程序的入口。
我们在下节会讲更多关于函数（function）的内容，但是现在，只需要知道程序从哪里开始就够了。
开头的大括号`{`，表示函数体的开始。
=======

The `main()` function is the entry point of every Rust program. We’ll talk more
about functions in the next section, but for now, all we need to know is that
this is where our program begins. The opening curly brace, `{`, indicates the
start of the function’s body.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
    let x = 5;
```

这是我们的第一个‘变量绑定’，它是用‘`let`语句（statement）’创建的。

这个`let`语句格式是这样的:

```text
let NAME = EXPRESSION;
```
<<<<<<< HEAD
一个`let`语句首先会对`EXPRESSION`进行求值，然后把结果值绑定给`NAME`，以便它能在后面的程序中被引用。
在这个简单示例中，表达式已经是一个值了，是5，但是我们能实现相同的效果:
=======

A `let` statement first evaluates the `EXPRESSION`, and then binds the
resulting value to `NAME` so that it can be referred to later in the program.
In our simple example, the expression was already a value, 5, but we could
achieve the same effect with:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust
let x = 2 + 3;
```

一般情况下，`let`语句跟模式（pattern）一起工作，变量名只是模式的一种简单形式。
模式，是Rust的重要组成部分，我们将在后面看到更复杂更强大的模式。

<<<<<<< HEAD
在这样做之前，我们先来把这个例子的剩余部分弄清楚。
来看下一行:
=======
Before we do that, though, let’s finish investigating this example. Here’s the
next line:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
    println!("The value of x is: {}", x);
```
`println!`宏在屏幕上打印文本。
我们可以告诉大家，这是一个宏，因为那个`!`。
现在还不会学习如何编写宏，你将在本书的后面学到，但是我们将用到由整个标准库提供的宏。
每次你看到`!`，请记住，这意味着一个宏。
宏可以为语言增加新的语法，并且`!`意味着提醒某件事非比寻常。

<<<<<<< HEAD
`println!`，具体来说，有一个必须的参数，‘格式字符串（format string）’，以及任意个数的可选参数。
格式字符串可以包含特殊的文本`{}`。
每个`{}`都对应一个额外的参数。这里有一个例子:
=======
The `println!` macro prints text to the screen. We can tell that it’s a macro
due to the `!`. We won’t learn how to write macros until much later in the
book, but we’ll use macros provided by the standard library throughout. Every
time you see a `!`, remember that it signifies a macro. Macros can add new
syntax to the language, and the `!` is a reminder that things may look slightly
unusual.

`println!`, specifically, has one required argument, a ‘format string’, and
zero or more optional arguments. The format string can contain the special text
`{}`. Each instance of `{}` corresponds to an additional argument. Here’s an
example:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust
let x = 2 + 3;
let y = x + 5;
println!("The value of x is {}, and the value of y is {}", x, y);
```

<<<<<<< HEAD
你可以想象`{}`是一个固定好值的小蟹钳。
这样的占位符有很多高级的格式选项，我们将在后面讨论。
=======
You can think of `{}` as little crab pincers, holding the value in place. This
placeholder has a number of more advanced formatting options that we’ll discuss
later.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
}
```

<<<<<<< HEAD
最后，一个闭合大括号匹配了该`main()`函数声明的起始大括号，函数声明结束。
=======
Finally, a closing curly brace matches up with the opening curly brace that
declared the `main()` function, and declares its end.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

对于输出:

```text
The value of x is: 5
```

<<<<<<< HEAD
将`5`绑定给`x`，然后用`println!`将其打印到屏幕上。
=======
We assign `5` to a binding, `x`, and then print it to the screen with
`println!`.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

## 多个绑定

<<<<<<< HEAD
让我们尝试一个更复杂的模式。
对之前的示例做如下改变:
=======
Let’s try a more complex pattern. Change our example program to this:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

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
<<<<<<< HEAD
我们用一个`let`创建了两个绑定！
这是模式:
=======

We’ve created two bindings with one `let`! Here’s our pattern:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```text
(x, y)
```

这是值:

```text
(5, 6)
```

<<<<<<< HEAD
如你所见，上面的两行是让`x`绑定`5`，`y`绑定`6`。
我们也能用两个`let`语句:
=======
As you can see, the two line up visually, and so `let` binds `5` to `x` and `6`
to `y`. We could have used two `let` statements as well:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust
fn main() {
    let x = 5;
    let y = 6;
}
```

<<<<<<< HEAD
对于像这样简单的情况来说，两个`let`也许更清晰，但是其他情况，一次创建多个绑定也许更好。
当我们变得越来越精通Rust，就会找出哪种风格更好，但最多也只是个主观判断。
=======
In simple cases like this, two `let`s may be clearer, but in others, creating
multiple bindings at once is nice. As we become more proficient in Rust, we’ll
figure out which style is better, but it’s mostly a judgement call.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

## 类型注解（type annotation）

<<<<<<< HEAD
你可能已经注意到了，在前一个例子中，我们并没有声明`x`或`y`的类型。
Rust是一个 *静态类型（statically typed）*语言，也就是说，在编译时，我们必须知道所有绑定的类型。
但是注解每一个绑定的类型是个繁杂的工作，并且会让代码变的嘈杂。
为了解决这个问题，Rust使用了‘类型推导（type inference）’，即，它会尝试推断绑定的类型。
=======
You may have noticed that we didn’t declare the type of `x` or `y` in our
previous examples. Rust is a *statically typed* language, which means that at
compile time, we must know the types of all bindings. But annotating every
single binding with a type can feel like busywork, and make code noisy. To
solve this issue, Rust uses ‘type inference’, meaning that it attempts to infer
the types of your bindings.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

类型推导的主要方式是通过查看它是如何被用的。
让我们再次查看示例:

```rust
fn main() {
    let x = 5;
}
```

<<<<<<< HEAD
当我们把`5`绑定给`x`的时候，编译器知道`x`应该是一个数值类型。
在没有其他任何信息的情况下，它默认是`i32`类型，32位整数类型。
我们将在3.3节讨论更多关于Rust的基本类型。
=======
When we bind `x` to `5`, the compiler knows that `x` should be a numeric type.
Without any other information, it defaults to `i32`, a thirty-two bit integer
type. We’ll talk more about Rust’s basic types in section 3.3.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

下面是使用了`类型注解`的`let`语句示例:

```rust
fn main() {
    let x: i32 = 5;
}
```

<<<<<<< HEAD
我们可以添加一个冒号，然后是类型名称。
这里是使用了类型注解的`let`语句结构:

=======
We can add a colon, followed by the type name. Here’s the structure of a `let`
statement with a type annotation:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```text
let PATTERN: TYPE = VALUE;
```

<<<<<<< HEAD
注意，冒号和`TYPE`在`PATTERN`后面。
这里有使用了两个绑定的复杂模式:
=======
Note that the colon and the `TYPE` go _after_ the `PATTERN`, not in the pattern
itself. As an example, here’s our more complex pattern with two bindings:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust
fn main() {
    let (x, y): (i32, i32) = (5, 6);
}
```

<<<<<<< HEAD
就像用`PATTERN`匹配`VALUE`那样，我们也用`PATTERN`匹配`TYPE`。
=======
Just like we match up the `VALUE` with the `PATTERN`, we match up the `TYPE`
with the `PATTERN`.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

## 延迟初始化（Delayed Initialization）

<<<<<<< HEAD
绑定的初始值不是必须提供的，可以在之后再把值指派给它。试试这段代码:
=======
We do not have to provide bindings with an initial value, and can assign it
later. Try this program:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

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

<<<<<<< HEAD
执行的很顺利。
这就是引出一个问题: 如果在声明一个值之前尝试打印绑定会怎么样？
下面是演示此问题的代码:
=======
It’s all good. This raises a question, though: what if we try to print out a
binding before we declare a value? Here’s a program that demonstrates this
question:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
fn main() {
    let x;

    println!("The value of x is: {}", x);

    x = 5;
}
```

可以通过执行`cargo run`找出答案:

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

<<<<<<< HEAD
一个错误！
编译器不让我们这样去写程序。
这是编译器帮助我们在程序中发现错误的第一个示例。
不同的程序语言对这个问题的处理方法不同。
有些语言总是会初始化某种默认值。
另外一些语言会留着未初始化的值，而不保证你在初始化它之前用到它的时候会出现什么么蛾子。
Rust选择了另外一种: 抛出错误，并且强制要求程序员去说清楚他们到底想做什么。
在用`x`之前，必须初始化某种值。
=======
An error! The compiler won’t let us write a program like this. This is our
first example of the compiler helping us find an error in our program.
Different programming languages have different ways of approaching this
problem. Some languages always initialize values with some sort of default.
Other languages leave the value uninitialized, and make no promises about what
happens if you try to use something before initialization. Rust chooses
something else: error and force the programmer to explain what they want. We
must do some sort of initialization before we can use `x`.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

### 扩展错误解释

这有关于错误消息更有趣的部分:

```text
src/main.rs:4:39: 4:40 help: run `rustc --explain E0381` to see a detailed explanation
```
通过给`rustc`传入`--explain`就能看到扩展的错误解释。
并不是每个错误都有更详细的解释，但是大部分是如此。
这些扩展的解释试图展示错误发生的常见原因，以及问题的常见解决方案。

<<<<<<< HEAD
下面是`E0381`:
=======
We can see an extended explanation by passing the `--explain` flag to `rustc`.
Not every error has a longer explanation, but many of them do. These extended
explanations try to show off common ways that the error occurs, and common
solutions to the issue. Here’s `E0381`:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```bash
$ rustc --explain E0381
It is not allowed to use or capture an uninitialized variable. For example:

fn main() {
    let x: i32;
    let y = x; // error, use of possibly uninitialized variable

To fix this, ensure that any declared variables are initialized before being
used.
```

<<<<<<< HEAD
如果你对某个错误束手无策的话，这些解释可以帮到你。
编译器是你的朋友，并为你提供帮助。
=======
These explanations can really help if you’re stuck on an error. The compiler is
your friend, and is here to help.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

## 可变绑定

<<<<<<< HEAD
改变绑定的值会怎么样？ 这里有另外一个示例展示了这个问题:
=======
What about changing the value of a binding? Here’s another sample program that
asks this question:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
fn main() {
    let x = 5;

    x = 6;

    println!("The value of x is: {}", x);
}
```

`cargo run`给出了答案:

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

<<<<<<< HEAD
错误里提到`re-assigment of immutable variable`（重新指派不可变变量）
这是对的: 绑定是不可变的.
但是仅仅是指它们默认不可变。
当我们创建新绑定的时候，我们可以在模式前面增加`mut`来把绑定变成可变的。
这有个例子:
=======
The error mentions `re-assigment of immutable variable`. That’s right: bindings
are immutable. But they’re only immutable by default. In a pattern, when we’re
creating a new name, we can add `mut` in front to make the binding a mutable
one. Here’s an example:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

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

<<<<<<< HEAD
我们现在可以改变`x`绑定的值了。
注意该语法`let mut`不是一体的，而是在模式前使用了`mut`
对模式使用`()`更明显:
=======
We can now change the value that `x` binds to. Note that the syntax is not `let
mut` exactly; it’s using `mut` in a pattern. This becomes more obvious with our
`()` pattern:

>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
fn main() {
    let (mut x, y) = (5, 6);

    x = 7;
    y = 8;
}
```

编译器会对这段程序发点牢骚:

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

<<<<<<< HEAD
重新指派`x`是可以的，但是`y`却不行。
`mut`仅对就近的绑定起作用，而不是整个模式。
=======
It’s fine with re-assigning `x`, but not `y`. The `mut` only applies to the
name that follows it, not the whole pattern.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

### 重新指派，而不是变化

<<<<<<< HEAD
还有个细微之处，我们还没有讨论过: `mut`允许你去改变_绑定_，而不是改变_绑定的值_。
换句话说:
=======
There is one subtlety we haven’t covered yet: `mut` allows you to mutate _the
binding_, but not _what the binding binds to_. In other words:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust
fn main() {
    let mut x = 5;

    x = 6;
}
```

<<<<<<< HEAD
这不会改变`x`绑定的值，而是创建了一个新值，`6`，然后让`x`绑定了新值。
这是一个微妙但很重要的区别。
现在并没有太大差别，但是当我们的程序变得更复杂的时候，差异就会明显。
特别是，当给函数传递参数的时候，差异将显现。
我们将在下一节讨论函数的时候来探讨这种差别。
=======
This is not changing the value that `x` is bound to, but creating a new value,
`6`, and changing the binding to bind to it instead. It’s a subtle but
important difference. Well, for now, it does not make a lot of difference, but
when our programs get more complex, it will. Specifically, passing arguments to
functions will illustrate the difference. We’ll talk about that in the next
section, when we discuss functions.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

## 作用域（scope）

<<<<<<< HEAD
变量绑定有其生效的‘作用域’。
作用域起始于绑定的声明，结束于该声明所在代码块的结尾大括号。
我们仅能在‘作用域中’访问到绑定。
在“进入作用域之前”和“离开作用域之后”都不能访问绑定。
这里是一个示例:
=======
Variable bindings have a ‘scope’ in which they’re valid. That scope begins from
the point at which the binding is declared, and ends at the end of the next
block of code. We can only access bindings which are ‘in scope’. We cannot
access them ‘before they come into scope’ or ‘after they go out of scope’.
Here’s an example:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

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

<<<<<<< HEAD
一旦学习了关于`引用（reference）`和`特质（trait）`之后，绑定在作用域中的进进出出将会变的更加重要。
=======
What bindings are in and out of scope will become much more important later,
once we learn about ‘references’ and ‘traits’.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

## 绑定屏蔽（Shadowing）

<<<<<<< HEAD
关于绑定的最后一件事是: 它们可以用相同的名称‘屏蔽（shadow）’前一个绑定。
这里是一个简单示例:
=======
A final thing about bindings: they can ‘shadow’ previous bindings with the same
name. Here’s a sample program:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

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

<<<<<<< HEAD
在此输出中有两件有意思的事。
首先，Rust能编译并运行这段程序，没有问题。
其次，如我们所见，`x`的值是`6`。
但是，我们并没有把`x`声明为可变绑定。
而是声明了一个_新_的绑定，也把它命名为`x`，然后指派给它一个新值。
只要新的`x`被声明，旧的`x`绑定的值就无法被访问了。
如果你想改变一个值，但是又想让它不可变，那可以用绑定屏蔽。
比如:
=======
There are two interesting things in this output. First, Rust will compile and
run this program, no problem. And as we can see, the value of `x` is `6`. But
we didn’t declare `x` as mutable. Instead, we declared a _new_ binding that is
_also_ named `x`, and gave it a new value. The older value that we bound `x` to
is inaccessible as soon as the new `x` is declared. This can be useful if you’d
like to perform a few transformations on a value, and leave it immutable. For
example:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

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

<<<<<<< HEAD
这样可以修改`x`，但没有把绑定改成可变的。
这样做是有好处的，因为后面如果修改它的话，编译器会提示我们的。
假设计算出`12`以后，还想修改`x`。
如果没把程序改成“可变绑定”的风格，大概是这样:
=======
This lets us modify `x`, but not deal with mutation. This is nice because we
know that the compiler will let us know if we try to modify it later. Let’s
assume that after we calculate `12`, we don’t want to modify `x` again. If we
had written this program in a mutable style, like this:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

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
<<<<<<< HEAD
Rust很乐意让我们再次修改它为`15`。
把上面程序改成“不可变风格”以后，再去修改`x`:
=======

Rust is happy to let us mutate it again, to `15`. A similar program in our
immutable style will let us know about that accidental mutation, however:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

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

<<<<<<< HEAD
绑定屏蔽可能需要一些时间来适应，但是它非常强大，并且这和“不可变风格”的代码很配。

我们讨论一下关于在本节最初那个程序编译输出的问题。
这是其中一部分:
=======
Shadowing can take some time to get used to, but it’s very powerful, and works
well with immutability.

There was one more thing we should talk about in the output from compiling our
initial program. It’s this part:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```text
src/main.rs:2:9: 2:10 warning: unused variable: `x`, #[warn(unused_variables)] on by default
```

下面是两行相关的代码:

```rust
let x = 5;
let x = 6;
```

<<<<<<< HEAD
Rust知道屏蔽了绑定`x`，但是我们从始至终都没有用到过初始值。
这不是个错误，确切来说，它可能不是我们想要的结果。
在这种情况下，编译器发出了一个‘警告’，但是仍然会编译我们的程序。
`#[warn(unused_variables)]` 语法被叫做‘属性（attribute）’，我们将在后面的章节讨论。
更具体来讲，这样的警告被称为'lint'，它是一个古老术语，是对那些你不想织入布里的羊毛的称呼。
代码里这行lint很相似，它告诉我们，这里可能有一些并不需要的多余代码。
没有它，代码也会工作的很好。
这些警告值得注意，并要根据它们的提示修复这些问题。
因为它们可能是某种严重问题的信号。
拿本例来说，我们有可能并没有意识到已经屏蔽了绑定`x`（也许会造成严重问题）。
=======
Rust knows that we shadowed `x`, but we never ended up using the initial value.
This isn’t _wrong_, exactly, it just may not have been what we wanted. In this
case, the compiler issues a ‘warning’, but still compiles our program. The
`#[warn(unused_variables)]` syntax is called an ‘attribute’, which we’ll
discuss in a later section. More specifically, a warning like this is called a
‘lint’, which is an old term for the bits of sheep’s wool that you wouldn’t
want to put in cloth. Similarly, this lint is telling us that we may have an
extra bit of code we don’t need. Our program would work just fine without it.
It’s worth listening to these warnings, and fixing the problems they point out.
They can be signs of a larger problem. In this case, we may not have realized
that we were shadowing `x`.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

### 绑定屏蔽和作用域

<<<<<<< HEAD
跟其他绑定一样，一个绑定屏蔽另外一个绑定也是只在作用域内有效。
这里是示例代码:
=======
Like any binding, a binding that shadows another binding will go away at the
end of a scope. Here’s an example program:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

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
