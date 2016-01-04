# 函数（Function）

<<<<<<< HEAD
函数在Rust代码中很普遍。我们已经在本书的前面章节中见识了最重要的函数:`main()`:
=======
Functions are pervasive in Rust code. We’ve already seen the most important
function, `main()`, in previous sections of the book:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust
fn main() {
    println!("Hello, world!");
}
```

我们可以用`fn`关键字声明新的函数:

```rust
fn another_function() {
    println!("Another function.");
}
```

<<<<<<< HEAD
Rust代码使用`蛇形(snake_case)`风格的函数命名: 全部小写，用下划线分割多个单词。（此风格也用于变量的命名。）
通过使用它的名字和括号，我们能调用任何已经定义好的任何函数:
=======
Rust code uses `snake_case` as a style for function names: all lower case, with
underscores separating words. (It also uses them for variable names, too.) We
can can call any function we’ve defined by using its name and some parentheses:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust
fn main() {
    println!("Hello, world!");

    another_function();
}

fn another_function() {
    println!("Another function.");
}
```

<<<<<<< HEAD
让我们开启一个新项目来探索函数。
打开重点，定位到你想保存此项目的目录下。在那里，使用Cargo来生成新项目:
=======
Let’s start a new project to explore functions. Open a terminal, and navigate
to the directory where you’d like to keep your projects. From there, use Cargo
to generate a new project:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```bash
$ cargo new --bin functions
$ cd functions
```

把上面那个新示例放在`src/main.rs`中，然后运行它:

```bash
$ cargo run
   Compiling functions v0.1.0 (file:///home/steve/tmp/functions)
     Running `target/debug/functions`
Hello, world!
Another function.
```

<<<<<<< HEAD
正如我们所见，是按顺序执行的: 首先，打印"Hello, world!"信息，然后调用`another_function()`。
然后打印出的消息也是如此。
=======
As we can see, the lines execute in order: first, we print out our “Hello,
world!” message, and then `another_function()` is called. It then prints its
message as well.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

## 函数参数

函数也能携带参数:

```rust
fn main() {
    another_function(5);
}

fn another_function(x: i32) {
    println!("The value of x is: {}", x);
}
```

让我们尝试运行它:

```bash
$ cargo run
   Compiling functions v0.1.0 (file:///home/steve/tmp/functions)
     Running `target/debug/functions`
The value of x is: 5
```

让我们仔细看看`another_function()`的用法:

```rust,ignore
fn another_function(x: i32) {
```

声明单个参数的函数格式像这样:

```text
fn NAME(PATTERN: TYPE) {
```

<<<<<<< HEAD
你没看错，模式又出现了。
这里的参数声明怎么那么像我们之前用过的`let`绑定:
=======
That’s right, patterns appear again. Consider how the parameter declaration
here looks like the `let` bindings we used earlier:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
let x: i32;
fn another_function(x: i32) {
```

<<<<<<< HEAD
这里仅有一个不同: 在函数中使用，我们_必须_声明类型。
这是一个深思熟虑的决定：我们发现，函数中要求类型注解，就意味着不需要在其他任何地方再这样做了。
=======
There’s only one difference here: in function signatures, we _must_ declare the
type. This is a deliberate decision; we find that requiring type annotations in
functions means that you almost never need them anywhere else.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

你可以用逗号分隔多个参数:

```text
fn NAME(PATTERN, PATTERN, PATTERN, PATTERN...) {
```

这里有个完整的示例:

```rust
fn main() {
    another_function(5, 6);
}

fn another_function(x: i32, y: i32) {
    println!("The value of x is: {}", x);
    println!("The value of y is: {}", y);
}
```

来运行一下:

```bash
$ cargo run
   Compiling functions v0.1.0 (file:///home/steve/tmp/functions)
     Running `target/debug/functions`
The value of x is: 5
The value of y is: 6
```

我们也可以把绑定作为函数的参数传入:

```rust
fn main() {
    let a = 5;
    let b = 6;

    another_function(a, b);
}

fn another_function(x: i32, y: i32) {
    println!("The value of x is: {}", x);
    println!("The value of y is: {}", y);
}
```

效果是相同的:

```bash
$ cargo run
   Compiling functions v0.1.0 (file:///home/steve/tmp/functions)
     Running `target/debug/functions`
The value of x is: 5
The value of y is: 6
```

<<<<<<< HEAD
注意，绑定叫做`a`和`b`，但是在函数内部，是通过`x`和`y`来引用的。
函数内部的作用域中，仅有它的参数可用。
绑定被当作参数传入不需要跟参数的名字一样。
=======
Note that our bindings are called `a` and `b`, yet inside of the function, we
refer to them by the names in the signature, `x` and `y`. Inside a function,
only its parameters are in scope, so we need to use those names. Bindings
passed as parameters don’t need to have the same name as the arguments.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

## 返回值

函数也可把值返回给调用它们的函数:

```TEXT
fn NAME(PATTERN, PATTERN, PATTERN, PATTERN...) -> TYPE {
```

<<<<<<< HEAD
我们没有命名返回值，但是我们可以在`->`后声明它们的类型。
这里是一个简单示例:
=======
We don’t name return values, but we do declare their type, after an arrow:
`->`. Here’s a sample program:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust
fn main() {
    let x = five();

    println!("The value of x is: {}", x);
}

fn five() -> i32 {
    5
}
```

尝试运行它:

```bash
$ cargo run
   Compiling functions v0.1.0 (file:///home/steve/tmp/functions)
     Running `target/debug/functions`
The value of x is: 5
```

<<<<<<< HEAD
这里有两个重要的点。
首先，我们可以使用函数的返回值去初始化一个绑定:
=======
Let’s examine this in more detail. There are two important bits. First, we can
use the return value of a function to initialize a binding:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
let x = five();
```

因为`five()` 返回了`5`, 等效于:

```rust
let x = 5;
```

第二个有意思的点是`five()`本身:

```rust
fn five() -> i32 {
    5
}
```

<<<<<<< HEAD
没有参数，并且返回了类型`i32`。
然而，函数体只有一个单独的`5`。
这有个细节，你可能注意到了: 在我们的程序中总是以分号结束每一行。
但是这里没有分号。为什么没有呢？
=======
We have no arguments, and our return type, `i32`. However, the body of this
function is a lonely `5`. There’s a detail here that you may or may not have
noticed: we’ve ended almost every line in our programs with a semicolon.
There’s no semicolon here, though. Why not?
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

这个问题的答案是:

> 函数的返回值是它最后表达式的值。

我们还没有谈到表达式，所以这个定义并没有多大帮助。
让我们继续。

## 语句（statement）和表达式（expression）

<<<<<<< HEAD
表达式是进行求值的代码片段。思考一些数学操作符，比如:
=======
Expressions are bits of code that evaluate to a value. Consider some math
operations, like this:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
5 + 6
```

<<<<<<< HEAD
我们可以计算这个表达式，并且得出值`11`。
在Rust中，大部分代码片段是表达式。
例如，函数调用是一个表达式:
=======
We can evaluate this expression, and come up with a value: `11`. In Rust, most
bits of code are expressions. For example, calling a function is an expression:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
foo(5)
```

该表达式的值等于`foo()`函数的返回值。

<<<<<<< HEAD
那么，这为什么如此重要？
并非一切都是表达式，还有一种叫做‘语句’的东西。
表达式用于_计算_，而语句用于_绑定_或_执行_。
它们之间的差异比较微妙。
我们已经见识了两种语句: `let`语句和`fn`声明。

因为`let`是语句而非表达式，所以你不能把它指派给另一个绑定。
下面这个例子并不能正常执行:
=======
So why does this matter? Well, not everything is an expression. Some things are
‘statements’. Expressions _compute_ something, but statements _bind_ or _do_
something. It’s a subtle difference. We’ve already seen two kinds of
statements: `let` statements, and `fn` declarations.

Because `let` is a statement, not an expression, you can’t assign it to another
binding. Here’s an example that doesn’t work:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
fn main() {
    let x = (let y = 6);
}
```

如果我们尝试运行此程序，会报错:

```bash
$ cargo run
   Compiling functions v0.1.0 (file:///home/steve/tmp/functions)
src/main.rs:2:14: 2:17 error: expected identifier, found keyword `let`
src/main.rs:2     let x = (let y = 6);
                           ^~~
src/main.rs:2:18: 2:19 error: expected one of `!`, `)`, `,`, `.`, `::`, `{`, or an operator, found `y`
src/main.rs:2     let x = (let y = 6);
                               ^
Could not compile `functions`.
```


<<<<<<< HEAD
我们也不能以某种方式把`fn`声明指派给某个绑定。

所以，这和返回值有什么关系吗？
`{}`是一个‘块（block）’，它是个表达式，我们之前用它创建过新作用域。
让我们探索一下`{}`。
它看起来就像这样:
=======
So what’s this have to do with return values? Well, `{}`, a ‘block’ that we
used earlier to create new scopes, _is_ an expression. Let’s take a closer look
at `{}`. It looks like this:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```text
{
    STATEMENT*
    EXPRESSION
}
```

<<<<<<< HEAD
这里的`*`是指‘0个或多个’，所以，表达式前面的语句可以是任意数量的语句。
因为块本身是表达式，所以我们可以在块中内嵌块。
并且因为它们有返回值，所以我们可以在`let`语句中使用它们。
=======
The `*` there means ‘zero or more’, so we can have any number of statements
followed by an expression. Since blocks are expressions themselves, we can nest
blocks inside of blocks. And since they return a value, we can use them in
`let` statements:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust
fn main() {
    let x = 5;

    let y = {
        let z = 1;

        x + z + 5
    };

    println!("The value of y is: {}", y);
}
```

运行此程序:

```bash
   Compiling functions v0.1.0 (file:///home/steve/tmp/functions)
     Running `target/debug/functions`
The value of y is: 11
```

现在使用块来绑定`y`:

```rust,ignore
let y = {

};
```

<<<<<<< HEAD
因为块可以包含语句，我们创建一个新的变量绑定`z`，并且给它一个值。
然后我们做了一些数学运算作为该块最后的表达式:
=======
Since the block can contain statements, we create a new variable binding, `z`,
and give it a value. We then do some math for the final expression of the
block:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
{
    let z = 1;

    x + z + 5
}
```

<<<<<<< HEAD
`5 + 1 + 5` 是 `11`, 所以整个块的值是`11`。
该值就会代入给`let`语句中的`y`:
=======
`5 + 1 + 5` is `11`, and so the value of the entire block is `11`. This gets
substituted into our `let` statement for `y`:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
let y = 11;
```

因此，`y`是`11`。

<<<<<<< HEAD
我们还在什么地方使用了块？答案是，函数体:
=======
Where else do we use blocks? As the body of functions! They’re very similar:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust
fn main() {
    let x = 5;

    let y = {
        x + 1
    };

    println!("The value of y is: {}", y);

    let y = plus_one(x);

    println!("The value of y is: {}", y);
}

fn plus_one(x: i32) -> i32 {
    x + 1
}
```

运行它:

```bash
$ cargo run
   Compiling functions v0.1.0 (file:///home/steve/tmp/functions)
     Running `target/debug/functions`
The value of y is: 6
The value of y is: 6
```

<<<<<<< HEAD
上面两个示例，我们使用块来产生值。
在第一个示例中，使用`let`来指派:
=======
In both cases, we use a block to produce a value. In the first case, it’s
assigning with `let`:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
let y = {
```

第二个示例中，是函数的返回值:

```rust,ignore
fn plus_one(x: i32) -> i32 {
```

### 表达式语句

这是关于表达式和语句的一个细节: 分号可以把任意表达式变成语句。

<<<<<<< HEAD
让我们用`plus_one()`制造一个错误:
=======
There’s one more detail about expressions and statements: a semicolon takes any
expression, and turns it into a statement. Let’s accidentally cause an error
with `plus_one()`:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust,ignore
fn main() {
    let x = plus_one(5);

    println!("The value of x is: {}", x);
}

fn plus_one(x: i32) -> i32 {
    x + 1;
}
```

<<<<<<< HEAD
现在，我们返回的是一个语句`x+1;`，而不是表达式`x+1`。

运行它会报错:
=======
Instead of an expression, `x + 1`, we’ve now turned it into a statement,
`x + 1;`.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a


```bash
$ cargo run
   Compiling functions v0.1.0 (file:///home/steve/tmp/functions)
src/main.rs:7:1: 9:2 error: not all control paths return a value [E0269]
src/main.rs:7 fn plus_one(x: i32) -> i32 {
src/main.rs:8     x + 1;
src/main.rs:9 }
src/main.rs:7:1: 9:2 help: run `rustc --explain E0269` to see a detailed explanation
src/main.rs:8:10: 8:11 help: consider removing this semicolon:
src/main.rs:8     x + 1;
                       ^
error: aborting due to previous error
Could not compile `functions`.
```

<<<<<<< HEAD
这是Rust给了我们汇报: 甚至建议移除分号来修复错误。
但是主要的错误信息是问题的关键: 语句没有计算值，而函数要返回`i32`类型的值。
=======
Rust has our back here: it even suggests removing the semicolon, which fixes
the error. But the main error message is the core of the issue: statements
don’t evaluate to a value, yet we want to return an `i32`.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

实践中，Rust程序员没有经常考虑这个层次的规则。
通常情况下，你可以在多数行数的末尾加分号，可能不是在块的结尾去加。

## 返回多个值

<<<<<<< HEAD
函数不能直接返回多个值。
这只是一个技巧。还记得我们用来演示复杂绑定中`()`的用法吗？
=======
Functions cannot directly return multiple values. There’s a trick, however.
Remember the `()`s we used when showing off complex bindings?
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust
fn main() {
    let (x, y) = (5, 6);
}
```

<<<<<<< HEAD
这种形式叫做`元组（tuple）`，Rust的基本类型之一。
元组是元素的匿名集合。
但是因为元组是一个独立的整体，我们可以把它用作函数返回多个值的一种方法:
=======
They form something called a ‘tuple’, one of Rust’s basic types. A tuple is an
anonymous collection of elements. But since a tuple is a singular thing, we can
use it as a way to return multiple values from functions:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust
fn main() {
    let (x, y) = two_numbers();

    println!("The value of x is: {}", x);
    println!("The value of y is: {}", y);
}

fn two_numbers() -> (i32, i32) {
    (5, 6)
}
```

运行它:

```bash
$ cargo run
   Compiling functions v0.1.0 (file:///home/steve/tmp/functions)
     Running `target/debug/functions`
The value of x is: 5
The value of y is: 6
```

<<<<<<< HEAD
这里有两个有意思的变化: 把`two_numbers()`的返回值指派给了`x`和`y`和`two_numbers()`声明本身。

=======
There are two interesting changes here: assigning the return value of
`two_numbers()` to `x` and `y`, and the declaration of `two_numbers()` itself.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

让我们先来看看声明:

```rust
fn two_numbers() -> (i32, i32) {
    (5, 6)
}
```

<<<<<<< HEAD
`(i32, i32)`应该很熟悉了。
我们在之前的`let`绑定中见过:
=======
The `(i32, i32)` should look familiar. We saw it in `let` bindings earlier:
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

```rust
let (x, y): (i32, i32) = (5, 6);
```

<<<<<<< HEAD
`(i32, i32)`语法是指“在元组中使用了两个`i32`类型”。
`(5, 6)` 用`5` 和 `6`创建了一个新的元组。
=======
The `(i32, i32)` syntax says “a tuple with two `i32`s in it.” The `(5, 6)`
syntax creates a new one, with `5` and `6`.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a

这个元组被返回，然后指派给`x`和`y`:

```rust,ignore
let (x, y) = two_numbers();
```


<<<<<<< HEAD
这一切是如何做到的呢?

我们把这种行为叫做`let`‘解构’，因为在`=`后面的表达式结构被拆开了。
=======
We call this behavior of `let` ‘destructuring’, because it takes the structure
of the expression that comes after the `=` and takes it apart.
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a
