Quick Reference Guide
=====================

# 1. Introduction

> [Go (programming language)](http://en.wikipedia.org/wiki/Go_%28programming_language%29) is a statically-typed language with syntax loosely derived from that of C, adding garbage collection, type safety, some dynamic-typing capabilities, additional built-in types such as variable-length arrays and key-value maps, and a large standard library.

> [Go](http://golang.org/) ( or **golang** ) is an open source programming language that makes it easy to build simple, reliable, and efficient software;

Follow the [QuickInstallationGuide](Chapter 00 - Installation.md) to have a fully working Go development environment on Windows or Linux or MacOS.
- [Downloads](https://golang.org/dl/)

## 1.1. Roots

Go, also commonly referred to as **golang**, is a programming language initially developed at Google in 2007 by Robert Griesemer, Rob Pike, and Ken Thompson. It become a public open-source project on November 10, 2009.

The mascot, [Gordon](https://blog.golang.org/gopher), and the logo of Go were designed by [Renée French](http://en.wikipedia.org/wiki/Ren%C3%A9e_French), spouse of Rob Pike.

## 1.2. Recent History

Go 1 was released on March 28, 2012.

## 1.3. Authors

- [Robert Griesemer](http://en.wikipedia.org/wiki/Robert_Griesemer)
- [Rob Pike](http://en.wikipedia.org/wiki/Rob_Pike)
- [Ken Thompson](http://en.wikipedia.org/wiki/Ken_Thompson)

## 1.4. Why?

[Why are you creating a new language?](https://golang.org/doc/faq#creating_a_new_language):

- There were two major groups of languages:
  - Those that favor efficient compilation and execution;
  - Those that favor ease of programming and are less verbose.
- No mainstream language, at the time, supported both groups well enough;
- Given a choice, programmers would go for ease over efficiency and safety;
- Go is an attempt to combine the easiness of programming of an interpreted dynamically type language, such as Python or Javascript, with the efficiency and safety of a statically typed compiled language;
- Go aims to be fast to compile and fast to execute;
- Go also strives to be modern, with support for networked and multi-core computing.

> Go is designed to scale efficiently so that it can be used to build very big applications and to compile even a large program in mere seconds on a single computer. The lightning-fast compilation speed is made possible to a small extent because the language is easy to parse, but mostly because of its dependency management. Since Go programs are so fast to build, it is practical to use them in situations where scripting languages are normally used.

> Go uses a very clean and easy-to-understand syntax that avoids the complexity
and verbosity of older languages. And Go is a strongly statically typed language, something which many programmers regard as essential for writing large programs. Yet Go's typing is not burdensome due to Go's short _declare and initialize_ variable declaration syntax ( with type inference ) and because Go also supports a powerful and convenient version of duck typing.

> Arguably, C++, Objective-C, and Java have all attempted to be better Cs ( the
latter indirectly as a better C++ ). Go can also be seen as an attempt to be a better C, even though Go's clean, light syntax is reminiscent of Python and Go's slices and maps are very similar to Python's lists and dicts. However, Go is closer in spirit to C than to any other language, and can be seen as an attempt to avoid C's drawbacks while providing all that's best in C, as well as adding many powerful and useful features that are unique to Go.

## 1.5. Features

- Compiled, instead of interpreted or byte-coded for a virtual machine;
- Fast, to compile and to execute;
- With implementations on all major operating systems~~, and even on top of JVM or CLR~~;
- ~~REPL ( Read-Eval Print Loop ) environment~~;
- Statically typed and safe;
- With type inference and a postfix notation for types;
- Succinct and flexible syntax that minimizes syntactic noise and serves as a foundation for domain-specific languages. Also offers a tool for imposing common coding style;
- Garbage Collector;
- Easy concurrency, with Channels and GoRoutines;
- Support for UTF-8;
- Built-in support for rational numbers, complex numbers and arbitrary-precision arithmetic;
- Embedding code in strings ( interpolation );
- Literal notation for arrays, hashes, regular expressions ~~and symbols~~;
- Lexical closures, iterators ~~and generators, with a unique block syntax~~;
- Methods can have arguments with default values and a variable number of arguments;
- Object-oriented with composition and duck typing, through interfaces, without mixins and without introspection and reflection;
- Two levels of variable scope, either global or local;
- ~~Dynamic reflection and alteration of objects to facilitate metaprogramming~~;
- ~~First-class continuations~~;
- ~~Operator overloading~~;
- Exception handling;
- ~~Custom dispatch behavior ( through method_missing and const_missing )~~;
- Native plug-in API in C;
- ~~Centralized package management through RubyGems~~;
- Large standard library, including modules for YAML, JSON, XML, CGI, OpenSSL, HTTP, FTP, RSS, curses, zlib, and Tk;
- **Open Source**.

----

To keep language simple and concise, following features commonly available in similar languages are omitted:

- No support for type inheritance;
- No support for method or operator overloading;
- No support for circular dependencies among packages;
- No support for pointer arithmetic;
- No support for assertions;
- No support for generic programming.

## 1.6. Style Guides

The [official coding style](https://github.com/golang/go/wiki/CodeReviewComments) is kept on GitHub, by the authors and the community.

> Good code should be easy to maintain. If code follows a standard format for writing it becomes easier for maintaining it and also enhancing it. Especially when there are different developers looking at the code in the present and the future, a standard is helpful. Though Go standards do not insist on a coding style, it does strongly suggest certain styles. The **go fmt** tool is an implementation of those styles, so that code could be reformatted to fit the standard. 

## 1.7. Official Documentation

There is a [portal](https://golang.org/doc/) that lists the several official sources for learning and using Go.
