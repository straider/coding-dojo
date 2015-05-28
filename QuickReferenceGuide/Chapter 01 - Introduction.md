Quick Reference Guide
=====================

# 1. Introduction

Ruby is a dynamic, reflective, object-oriented, general-purpose programming language. Ruby includes including object-oriented design, classes with inheritance, mixins, iterators, closures, exception handling and garbage collection.

Follow the [QuickInstallationGuide](Chapter 00 - Installation.md) to have a fully working Ruby development environment on Windows or Linux or MacOS.

## 1.1. Roots

Ruby was conceived on February 24, 1993. In a 1999 post to the ruby-talk mailing list, Ruby author [Yukihiro Matsumoto](http://en.wikipedia.org/wiki/Yukihiro_Matsumoto) describes some of his early ideas about the language:

> I was talking with my colleague about the possibility of an object-oriented scripting language. I knew Perl ( Perl4, not Perl5 ), but I didn't like it really, because it had the smell of a toy language ( it still has ). The object-oriented language seemed very promising. I knew Python then. But I didn't like it, because I didn't think it was a true object-oriented language — OO features appeared to be add-on to the language. As a language maniac and OO fan for 15 years, I really wanted a genuine object-oriented, easy-to-use scripting language. I looked for but couldn't find one. So I decided to make it.

Matz describes the [design of Ruby](http://www.informit.com/articles/article.aspx?p=18225) as being like a simple Lisp language at its core, with an object system like that of Smalltalk, blocks inspired by higher-order functions, and practical utility like that of Perl.

## 1.2. Recent History

The first public release of Ruby 0.95 was announced on Japanese domestic newsgroups on December 21, 1995 and on December 25, 1996 ( one year later ) the 1st version was released.

- Ruby 1.8 was initially released in August 2003, was stable for a long time, and was retired June 2013;
- Ruby 1.9 was released in December 2007. Ruby 1.9 is obsolete since February 23 2015;
- Ruby 2.0 was released in February 24, 2013;
- Ruby 2.1.0 was released on Christmas Day in 2013;
- Ruby 2.2.0 was released on Christmas Day in 2014.

## 1.3. Authors

Yukihiro Matsumoto, a.k.a. Matz, born 14 April 1965 is a Japanese computer scientist and software programmer best known as the chief designer of the Ruby programming language and its reference implementation, Matz's Ruby Interpreter ( MRI ).

Yukihiro Matsumoto talks with Bill Venners about Ruby's and this conversation is split in 4 parts: [The Philosophy of Ruby](http://www.artima.com/intv/ruby.html), [Dynamic Productivity with Ruby](http://www.artima.com/intv/tuesday.html), [Blocks and Closures in Ruby](http://www.artima.com/intv/closures.html) and [Matz on Craftsmanship](http://www.artima.com/intv/craft.html).

Matz received the 2011 Award for the Advancement of Free Software from the Free Software Foundation ( FSF ), at the 2012 LibrePlanet conference at the University of Massachusetts Boston, in Boston.

## 1.4. Why?

> Ruby is said to follow the principle of least astonishment (POLA), meaning that the language should behave in such a way as to minimize confusion for experienced users. Matsumoto has said his primary design goal was to make a language that he himself enjoyed using, by minimizing programmer work and possible confusion.

## 1.5. Features

- With implementations on all major operating systems, and even on top of JVM or CLR;
- REPL: Interactive Ruby Shell ( irb );
- Dynamic typing and duck typing;
- Succinct and flexible syntax that minimizes syntactic noise and serves as a foundation for domain-specific languages;
- Garbage Collector;
- Native threads and cooperative fibers ( fibers are 1.9 / YARV feature );
- Supports **UTF-8**;
- Built-in support for rational numbers, complex numbers and arbitrary-precision arithmetic;
- Embedding code in strings ( interpolation );
- Literal notation for arrays, hashes, regular expressions and symbols;
- Lexical closures, iterators and generators, with a unique block syntax;
- Methods can have arguments with default values and a variable number of arguments;
- Thoroughly object-oriented with inheritance, mixins and metaclasses;
- Four levels of variable scope ( global, class, instance, and local ), denoted by _sigils_ ( $, @ ) or the lack thereof;
- Dynamic reflection and alteration of objects to facilitate metaprogramming;
- First-class continuations;
- Operator overloading;
- Exception handling;
- Custom dispatch behavior ( through method_missing and const_missing );
- Native plug-in API in C;
- Centralized package management through **RubyGems**;
- Large standard library, including modules for YAML, JSON, XML, CGI, OpenSSL, HTTP, FTP, RSS, curses, zlib, and Tk;
- **Open Source**.

## 1.6. Style Guides

- [The Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide): A community-driven Ruby coding style guide;
- [Ruby Guide](http://www.caliban.org/ruby/rubyguide.shtml): this document was originally written for internal use in the Operations department at Google. This document will suggest some guidelines for writing Ruby code in such a way that a common stylistic vocabulary may emerge, thereby increasing the ease with which source code may be read and shared.

# 1.7. Official Documentation

The [official documentation](http://ruby-doc.org/) is divided in two: Core API and Standard Library API.

- **ri**: ri tool is used to view the Ruby documentation off-line;
- **RDoc**: RDoc is a documentation system. If one puts comments in program files ( Ruby or C ) that follow the prescribed RDoc format then **rdoc** scans those files, extracts the comments, organizes them intelligently ( indexed according to what they comment on ) and creates nicely formatted documentation from them.
