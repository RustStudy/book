# 基本类型

我们已经发现了，Rust中每个值都有某种形式的类型。
语言本身内置了一些类型，我们把这些类型叫做‘基本’类型，因为你不能创新创建它们。
当然，在标准库里也提供了许多非基本类型。

不要忘记，你能依靠类型推导（type inference）来找出绑定的类型，也可以明确地标注类型:

```rust
fn main() {
let x: i32 = 5;
}
```

## 整数

你已经见过了一个基本类型: `i32`.
Rust中有很多内置的数字类型.

这里有一个Rust中整数类型的图表:

| | 符号（signed） | 无符号（unsigned） |
|--------|--------|----------|
| 8-bit | i8 | u8 |
| 16-bit | i16 | u16 |
| 32-bit | i32 | u32 |
| 64-bit | i64 | u64 |
| arch | isize | usize |


Rust有符号型和无符号型两种数字类型变种，每个变种都有明确的大小。无符号型数总是正的，符号型数有正有负。
（想想‘加号’或‘减号’: 符号型数）

符号型数是用‘二进制补码（two’s compliment）’表示的。

最后的`isize`和`usize`是基于程序运行的计算机种类不同而大小不同。
如果在64位架构的机器上，它们是64位，如果在32位架构的机器上，那它们就是32位。

那么如何选择这些类型呢？如果你真的不知道怎么选，那么默认就是个好的选择:
整数类型默认是`i32`。

`isize`/`usize`主要用于索引某种集合。我们马上就会在第一个集合——数组——中讲到更多相关的内容。

## 浮点数

Rust也有两种基本的浮点数类型: `f32` and `f64`.
它们分别是32位和64位大小。
默认是 `f64`.

```rust
fn main() {
let x = 2.0; // f64

let y: f32 = 3.0; // f32
}
```

浮点数是根据IEEE-754标准来表示的。
`f32`是单精度浮点数, `f64`是双精度浮点数.

## 元组

我们之前见过的另一种类型是元组（tuple）。
元组有‘数量（arity）’，也就是大小。
我们可能会这么说，“这是个3元组”，或者，“这是个5元组”。

元组的每个位置，都有明确的类型:


```rust
fn main() {
let x: (i32, f64, u8) = (500, 6.4, 1);
}
```

元组在Rust代码中使用比较保守。
这是因为元组中的元素是匿名的，让代码可读性变差。

### 元组索引

我们可以使用`.`后面加上我们想访问的索引来访问元组的元素:

```rust
fn main() {
let x: (i32, f64, u8) = (500, 6.4, 1);

let five_hundred = x.0;
let six_point_four = x.1;
let one = x.2;
}
```

如你所见，索引从`0`开始的。

### 单元素元组

还有最后一个使用元组的技巧: `(5)`实际上是有歧义的，它到底是一个元组还是在括号里的`5`？
使用逗号，可以消除歧义:

```rust
fn main() {
let x = (5); // x is an i32, no tuple. Think of it like (5 + 1) without the + 1, they’re for grouping.
// x是i32，不是元组。
let x = (5,); // x is a (i32), a tuple with one element.
// x是(i32)，是包含单个元素的元组。
}
```

## 函数

还有一种类型，我们一直在用，但是还没有明确的写出来。那就是，函数！
函数也是一种类型，是的，你甚至可以把函数作为变量！
这有个示例:

```rust
fn plus_one(x: i32) -> i32 {
x + 1
}

fn main() {
let f = plus_one;
let g: fn(i32) -> i32 = plus_one; // with an explicit type annotation

let five = f(4);
}
```

如你所见，类型声明非常相似:

```rust,ignore
fn(i32) -> i32 // type
fn plus_one(x: i32) -> i32 { // declaration
```

如果我们拿掉声明，去掉名字...

```rust,ignore
fn(i32) -> i32 // type
fn(x: i32) -> i32 {
```

然后再去掉参数名...

```rust,ignore
fn(i32) -> i32 // type
fn(i32) -> i32 {
```

就完全相同了！当然，我们也需要把`{`去掉。

最后，在本例中你需要注意的是，我们能用函数创建绑定:

```rust,ignore
fn main() {
let f = plus_one;

let five = f(4);
}
```


### 把函数作为参数

So why not just use the original name?
Well, we can pass functions as arguments to other functions!
Check this out:

```rust
fn plus_one(x: i32) -> i32 {
x + 1
}

fn plus_two(x: i32) -> i32 {
x + 2
}

fn twice(x: i32, f: fn(i32) -> i32) -> i32 {
let mut result = x;

result = f(result);
result = f(result);

result
}

fn main() {
let x = 5;

let y = twice(x, plus_one);
let z = twice(x, plus_two);

println!("The value of y is: {}", y);
println!("The value of z is: {}", z);
}
```

If we compile and run this, we’ll get this output:

```text
The value of y is: 7
The value of z is: 9
```

Let’s investigate in more detail.

```rust,ignore
fn twice(x: i32, f: fn(i32) -> i32) -> i32 {
```

This says “`twice()` is a function which takes two arguments.
`x` is a thirty-two bit integer, and `f` is a function which takes an `i32` and returns an `i32`.”

Inside of `twice()`, as you might imagine, we call the function `f` twice on `x`, and return the result.


```rust,ignore
let y = twice(x, plus_one);
let z = twice(x, plus_two);
```

The first time we call `twice()`, we pass `plus_one()` as an argument.
And `x` is `5`.
So `5 + 1 + 1 == 7`, hence our first line of output.
The second time, we pass `plus_two()` instead.
`5 + 2 + 2` is `9`, and our second line checks out too.

Passing functions to functions is very, very powerful.

## Booleans

Somewhat fundamental to all computing, Rust has a boolean type, `bool`, with two possible values:

```rust
fn main() {
let t = true;
let f: bool = false; // with explict type annotation
}
```

That’s really all there is to say about that!

## Arrays

So far, we’ve only represented single values in a binding.
Sometimes, though, it’s useful to have more than one value.
These kinds of data structures are called ‘collections’, and arrays are the ones we’ll learn about first.
Arrays look like this:

```rust
fn main() {
let a = [1, 2, 3, 4, 5];
}
```

An array’s type consists of the type of the elements it contains, as well as the length:

```rust
fn main() {
let a: [i32; 5] = [1, 2, 3, 4, 5];
}
```

An array is a single chunk of memory, allocated on the stack.

We can access elements of an array using indexing:

```rust
fn main() {
let a = [1, 2, 3, 4, 5];

let first = a[0];
let second = a[1];
}
```

In this example, `first` will hold the value `1`, and `second` will be bound to `2`.
Note that these values are copied out of the array; if the array changes, these bindings will not.
Here’s an example, which also shows us how we can modify elements of the array:

```rust
fn main() {
let mut a = [1, 2, 3, 4, 5];

let first = a[0];

a[0] = 7;

println!("The value of first is: {}", first);
}
```

Running this example will show that `first` is still `1`.
If we didn’t want a copy, but instead wanted to refer to the first element, whatever its value was, we need a new concept.
We’ll talk about ‘references’ in Section 4.

One last thing: now that we are modifying the array, `a` needs to be declared `mut`.

Arrays are our first real data structure, and so there’s a few other concepts that we haven’t covered in full yet.
There are two: the `panic!` macro, and a new way of printing things: `Debug`.

### Panic

We showed what happens when you access elements of an array, but what if we give an invalid index?

```rust,should_panic
fn main() {
let a = [1, 2, 3, 4, 5];

let invalid = a[10];

println!("The value of invalid is: {}", invalid);
}
```

If we run this example, we will get an error.
Let’s re-use our `functions` project from before.
Change your `src/main.rs` to look like the example, and run it:

```bash
$ cargo run
Compiling functions v0.1.0 (file:///home/steve/tmp/functions)
Running `target/debug/functions`
thread ‘<main>’ panicked at ‘index out of bounds: the len is 5 but the index is 10’, src/main.rs:4
Process didn’t exit successfully: `target/debug/functions` (exit code: 101)
```

It says that our thread panicked, and that our program didn’t exit successfully.
There’s also a reason: we had a length of five, but an index of 10.

A ‘panic’ can also be induced manually, with the `panic!` macro:

```rust,should_panic
fn main() {
panic!("Oh no!");
}
```

When the `panic!` macro runs, it will cause a panic.
When a Rust program panics, it starts a kind of controlled crash.
The current thread of execution will stop entirely.
As such, panics are reserved for serious, program-ending errors.
They’re not a general error-handling mechanism.

So why did this code panic?
Well, arrays know how many elements they hold.
When we access an element via indexing, Rust will check that the index is less than the length.
If it’s greater, it will panic, as something is very wrong.
This is our first example of Rust’s safety principles in action.
In many low-level languages, this kind of check is not done.
If you have an incorrect index, invalid memory can be accessed.
Rust protects us against this kind of error.

**Steve’s note: this next bit might be our first ‘advanced’ section, on get()?**

### Debug

So far, we’ve been printing values using `{}`.
If we try that with an array, though...

```ignore
fn main() {
let a = [1, 2, 3, 4, 5];

println!("a is: {}", a);
}
```

... we will get an error:

```bash
$ cargo run
Compiling functions v0.1.0 (file:///home/steve/tmp/functions)
src/main.rs:4:25: 4:26 error: the trait `core::fmt::Display` is not implemented for the type `[_; 5]` [E0277]
src/main.rs:4 println!(“a is {}”, a);
^
<std macros>:2:25: 2:56 note: in this expansion of format_args!
<std macros>:3:1: 3:54 note: in this expansion of print! (defined in <std macros>)
src/main.rs:4:5: 4:28 note: in this expansion of println! (defined in <std macros>)
src/main.rs:4:25: 4:26 help: run `rustc --explain E0277` to see a detailed explanation
src/main.rs:4:25: 4:26 note: `[_; 5]` cannot be formatted with the default formatter; try using `:?` instead if you are using a format string
src/main.rs:4:25: 4:26 note: required by `core::fmt::Display::fmt`
error: aborting due to previous error
```

Whew! The core of the error is this part: the trait `core::fmt::Display` is not implemented.
We haven’t discussed traits yet, so this is bound to be confusing!
Here’s all we need to know for now: `println!` can do many kinds of formatting.
By default, `{}` implements a kind of formatting known as `Display`: output for end-users.
The primitive types we’ve seen so far implement `Display`, as there’s only one way you’d show a `1` to a user.
But with arrays, the output is less clear.
Do you want commas or not?
What about the `[]`s?

Due to these questions, more complex types in the standard library do not implement `Display` formatting.
There is another kind of formatting, `Debug`, which is a bit different: output for programmers and debuggers.
We can ask `println!` to use `Debug` formatting with `:?`:

```rust
fn main() {
let a = [1, 2, 3, 4, 5];

println!("a is {:?}", a);
}
```

This will work:

```bash
$ cargo run
Compiling functions v0.1.0 (file:///home/steve/tmp/functions)
Running `target/debug/functions`
a is [1, 2, 3, 4, 5]
```

You’ll see this repeated later, with other types.
And we’ll cover traits fully later in the book, Section 9.

## char

We’ve only worked with numbers so far, but what about letters?
Rust’s most primitive alphabetic type is the `char`:

```rust
fn main() {
let c = 'z';
let z = 'ℤ';
}
```

Rust’s `char` represents a [Unicode Scalar Value], which means that it can represent a lot more than just ASCII.
“Character” isn’t really a concept in Unicode, however: your human intutition for what a ‘character’ is may not match up with a `char`.
It also means that `char`s are four bytes each.

[Unicode Scalar Value]: http://www.unicode.org/glossary/#unicode_scalar_value

The single quotes are important: to define a literal single character, we use single quotes.
If we used double quotes, we’d be defining a `&str`. Let’s talk about that next!

## str

We can declare literal strings with `"`s. We’ve seen them already, with `println!`:

```rust
fn main() {
println!("println! takes a literal string as an argument.");

let s = "We can also create bindings to string literals.";

let s: &str = "Here’s one with a type annotation.";
}
```

String literals are immutable, and of a fixed length.
Rust has a second string type, `String`, that we’ll discuss in section 8.

`&str`s are UTF-8 encoded.
