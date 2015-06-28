Quick Reference Guide
=====================

# 1. Introduction

> [Groovy](http://groovy-lang.org/) is an object-oriented programming language for the Java platform. It is a dynamic language with features similar to those of Python, Ruby, Perl, and Smalltalk. It can be used as a scripting language for the Java Platform, is dynamically compiled to Java Virtual Machine ( JVM ) bytecode, and interoperates with other Java code and libraries. Groovy uses a Java-like curly-bracket syntax. Most Java code is also syntactically valid Groovy, although semantics may be different.

Follow the [QuickInstallationGuide](Chapter 00 - Installation.md) to have a fully working Groovy development environment on Windows or Linux or MacOS.

## 1.1. Roots

> James Strachan first [talked](http://radio-weblogs.com/0112098/2003/08/29.html) about the development of Groovy on his blog in August 2003.

Cédric Champeau has an article on is blog, [Who is Groovy?](http://melix.github.io/blog/2015/02/who-is-groovy.html) that provides a timeline about the language, its main contributors and its history.

> 2003 is the inception year of Groovy. James Strachan, in August 2003, wanted to create a dynamic language for the JVM, inspired by Ruby, but closer to Java. Groovy was born, and the idea never changed over time: Groovy is the perfect companion for Java, a language which can be very close to Java in terms of syntax but also removes a lot of its boilerplate.

## 1.2. Recent History

- Groovy 1.0 was released on January 2, 2007;
- In November 2008, SpringSource acquired the Groovy and Grails company (G2One);
- In August 2009 VMWare acquired SpringSource;
- Groovy 2.0 was released in July, 2012;
- Groovy 3.0 is planned for release in late 2015, with support for a new Meta Object Protocol.

> Since version 2, Groovy can also be compiled statically, offering type inference and performance very close to that of Java.

> Groovy 2.4 will be the last major release under Pivotal Software's sponsorship, which is scheduled to end on March 31, 2015.

## 1.3. Authors

- James Strachan ( Creator ) left Groovy in 2005;
- Guillaume Laforge ( Project Manager ) since 2006;
- Jochen Theodorou ( Tech Lead ) since 2005;
- Paul King, joined in 2006 and is the most active contributor;
- Cedric Champeau joined in 2011.

## 1.4. Why?

> Most valid Java files are also valid Groovy files. Although the two languages are similar, Groovy code can be more compact, because it does not require all the elements that Java requires. This makes it possible for Java programmers to gradually learn Groovy by starting with familiar Java syntax before acquiring more Groovy idioms.

> In July 2009, Strachan wrote on his blog, "I can honestly say if someone had shown me the Programming in Scala book by Martin Odersky, Lex Spoon & Bill Venners back in 2003 I'd probably have never created Groovy." Strachan had left the project silently a year before the Groovy 1.0 release in 2007.

## 1.5. Features

- Implemented on top of JVM, interpreted or compiled;
- REPL: Interactive Groovy Shell ( **groovysh** and **groovyConsole** );
- Dynamic typing and duck typing;
- Succinct and flexible syntax that minimizes syntactic noise and serves as a foundation for domain-specific languages;
- Garbage Collector;
- Native threads ~~and cooperative fibers ( fibers are 1.9 / YARV feature )~~;
- Supports **UTF-8**;
- Built-in support for ~~rational numbers, complex numbers and~~ arbitrary-precision arithmetic;
- Embedding code in strings ( interpolation );
- Literal notation for arrays, hashes, regular expressions ~~and symbols~~;
- Lexical closures, iterators and generators~~, with a unique block syntax~~;
- Methods can have arguments with default values and a variable number of arguments;
- Thoroughly object-oriented with inheritance~~, mixins and metaclasses~~;
- Four levels of variable scope ( global, class, instance, and local )~~, denoted by _sigils_ ( $, @ ) or the lack thereof~~;
- Dynamic reflection and alteration of objects to facilitate metaprogramming;
- First-class continuations;
- Operator overloading;
- Exception handling;
- ~~Custom dispatch behavior ( through method_missing and const_missing )~~;
- ~~Native plug-in API in C~~;
- ~~Centralized package management through **RubyGems**~~;
- Large standard library, including modules for YAML, JSON, XML, CGI, OpenSSL, HTTP, FTP, RSS, curses, zlib, and Tk;
- **Open Source**.

## 1.6. Style Guides

There's a work in progress [Style Guide](http://groovy-lang.org/style-guide.html).

# 1.7. Official Documentation

There's a [portal](http://groovy-lang.org/documentation.html) with the official documentation for Groovy.
