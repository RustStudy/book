<<<<<<< HEAD
# 介绍

欢迎来到“Rust编程语言”，这是一本Rust的入门书。Rust是聚焦于安全、并发和性能的编程语言。
它维护这些目标而无需垃圾回收器，它在其他语言并不擅长的领域相当有用：内嵌于其他语言、对空间和时间有特定需求的程序，以及底层代码，比如设备驱动和操作系统。
它通过一些无运行时开销的编译时安全检查来提升当前语言的空间利用率，同时消除了所有的数据竞争。
Rust的目标也在于实现“零成本抽象（zero-cost abstractions）”，有些抽象的表现像是高级语言，即便如此，Rust仍然可以做到像底层语言那样的精确控制。

本书是写给那些已经有一定编程基础的读者，最少了解一门编程语言。
哪种语言并不是十分要紧，但是，如果你有使用过手工分配内存的底层语言经验，那么你学习起来将会更加容易。

读完本书以后，你写起Rust程序应该能得心应手。我们将通过小而精的示例来学习Rust的每个主题。
各个章节的顺序相互依赖，所以如果你跳过前面的内容，那么你可能不得不再跳回来查看相关概念。

## 为本书做贡献

本书是开源的。如果你发现错误，请不要犹豫，请给我们的[Github]发issue或pull request。

[GitHub]: https://github.com/rust-lang/book

## 翻译

@张汉东

为翻译做贡献，请给本书的[Github中文]发issue或pull request。

[Github中文]: https://github.com/RustStudy/book
=======
# Introduction

Welcome to “The Rust Programming Language”, an introductory book about Rust.
Rust is a programming language that’s focused on safety, concurrency, and
speed. It maintains these goals without having a garbage collector, making it a
useful language for a number of use cases other languages aren’t good at:
embedding in other languages, programs with specific space and time
requirements, and writing low-level code, like device drivers and operating
systems. It improves on current languages targeting this space by having a
number of compile-time safety checks that produce no runtime overhead, while
eliminating all data races. Rust also aims to achieve ‘zero-cost abstractions’
even though some of these abstractions feel like those of a high-level
language. Even then, Rust still allows precise control like a low-level
language would.

This book is written for a reader who already knows how to program in at least
one programming language. Which language that is does not matter very much,
though you may have an easier time if you’ve programmed in a low-level language
with manual memory allocation.

After reading this book, you should be comfortable writing Rust programs. We’ll
be learning Rust through small, focused examples that demonstrate each topic.
The chapters build upon each other, so if you skip ahead, you may have to skip
back to refer to a previous concept.

## Contributing to the book

This book is open source. If you find an error, please don’t hesitate to file an
issue or send a pull request [on GitHub].

[on GitHub]: https://github.com/rust-lang/book
>>>>>>> 3092afb04049eb6113c33f38258398a5574f1a0a
