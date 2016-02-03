Quick Reference Guide
=====================

# 1. Introduction

Follow the [QuickInstallationGuide](Chapter 00 - Installation.md) to have a fully working [Perl](https://www.perl.org/) development environment on Windows or Linux or MacOS.

**Note**: This documentation focus on Perl 5 and not on Perl 6.

## 1.1. Roots

> Perl is implemented as a core interpreter, written in C, together with a large collection of modules, written in Perl and C.

> Though Perl is not officially an acronym, there are various backronyms in use, the most well-known being "Practical Extraction and Reporting Language". Perl was originally developed by Larry Wall in 1987 as a general-purpose Unix scripting language to make report processing easier.

> The Perl language borrows features from other programming languages including C, shell script, awk, sed and Lisp. It provides powerful text processing facilities without the arbitrary data-length limits of many contemporary Unix commandline tools, facilitating easy manipulation of text files.

> Perl 5 gained widespread popularity in the late 1990s as a CGI scripting language, in part due to its unsurpassed regular expression and string parsing abilities. In addition to CGI, Perl 5 is used for graphics programming, system administration, network programming, finance, bioinformatics, and other applications.

> It has been nicknamed "the Swiss Army chainsaw of scripting languages" because of its flexibility and power, and possibly also because of its "ugliness". In 1998, it was also referred to as the "duct tape that holds the Internet together", in reference to both its ubiquitous use as a glue language and its perceived inelegance.

> No written specification or standard for the Perl language exists for Perl versions through Perl 5, and there are no plans to create one for the current version of Perl. There has been only one implementation of the interpreter, and the language has evolved along with it. That interpreter, together with its functional tests, stands as a de facto specification of the language.

## 1.2. Recent History

- Perl 5.20 was first released on May 27, 2014. Notable new features include subroutine signatures, hash slices/new slice syntax, postfix dereferencing (experimental), Unicode 6.3, rand() using consistent random number generator;
- Perl 5.18 was first released on May 18, 2013. Notable new features include the new dtrace hooks, lexical subs, more CORE:: subs, overhaul of the hash for security reasons, support for Unicode 6.2;
- Perl 5.16 was first released on May 20, 2012. Notable new features include the ability to specify a given version of Perl that one wishes to emulate, allowing users to upgrade their version of Perl, but still run old scripts that would normally be incompatible;
- Perl 5.14 was first released on May 14, 2011. It supports JSON;
- Perl 5.12 was first released on April 12, 2010;
- Perl 5.10 was first released on December 18, 2007, the 20th anniversary of Perl 1.0. It included notable new features, which brought it closer to Perl 6, such as switch statement (called "given"/"when"), regular expressions updates, and the smart match operator, "~~";
- Perl 5.8 was first released on July 18, 2002. It improved Unicode support, added a new I/O implementation, added a new thread implementation, improved numeric accuracy, and added several new modules;
- Perl 5.6 was released on March 22, 2000. Major changes included 64-bit support, Unicode string representation, large file support (i.e. files over 2 GiB) and the "our" keyword;
- Perl 5, released in 1994, was a nearly complete rewrite of the interpreter, and it added many new features to the language, including objects, references, lexical (my) variables, and modules;
- Perl 4, released in 1991, to mark that it was well documented by the "Camel Book"[^1];
- Perl 3, released in 1989, added support for binary data streams;
- Perl 2, released in 1988, featured a better regular expression engine;
- Perl 1 was released in 1987.

**Note**: As of 2013 this version still remains the most popular version of Perl.

[^1]: > In 1991, Programming Perl, known to many Perl programmers as the "Camel Book" because of its cover, was published and became the de facto reference for the language. At the same time, the Perl version number was bumped to 4, not to mark a major change in the language but to identify the version that was well documented by the book.

## 1.3. Authors

> [Larry Wall](https://en.wikipedia.org/wiki/Larry_Wall) began work on Perl in 1987, while working as a programmer at Unisys, and released version 1.0 to the comp.sources.misc newsgroup on December 18, 1987. In 1993 Wall abandoned Perl 4 to begin work on Perl 5.

> Perl was originally written by Larry Wall while he was working at NASA's Jet Propulsion Labs. Larry is an Internet legend: Not only is he well-known for Perl, but as the author of the UNIX utilities rn, which was one of the original Usenet newsreaders, and patch, a tremendously useful utility that takes a list of differences between two files activity is now widespread.

> Perl was originally named "Pearl". Wall wanted to give the language a short name with positive connotations; he claims that he considered (and rejected) every three- and four-letter word in the dictionary. He also considered naming it after his wife Gloria. Wall discovered the existing PEARL programming language before Perl's official release and changed the spelling of the name.

## 1.4. Why?

> Perl follows the theory of "no built-in limits". Wall was trained as a linguist, and the design of Perl is very much informed by linguistic principles. Examples include Huffman coding (common constructions should be short), good end-weighting (the important information should come first), and a large collection of language primitives. Perl favors language constructs that are concise and natural for humans to write, even where they complicate the Perl interpreter.

> Perl's syntax reflects the idea that "things that are different should look different." For example, scalars, arrays, and hashes have different leading sigils. Array indices and hash keys use different kinds of braces. Strings and regular expressions have different standard delimiters.

> There's more than one way to do it (TMTOWTDI or TIMTOWTDI, pronounced Tim Toady) is a Perl programming motto. The language was designed with this idea in mind, in that it “doesn't try to tell the programmer how to program.”

## 1.5. Features

- Perl is procedural in nature;
- Perl takes features from shell programming, using leading _sigils_; Perl uses _sigils_ on all accesses to variables, and unlike most other programming languages that use sigils, the sigil doesn't denote the type of the variable but the type of the expression;
- Perl takes lists from Lisp, hashes ("associative arrays") from awk, and regular expressions from sed;
- Also shared with Lisp are the implicit return of the last value in a block, and the fact that all statements have a value, and thus are also expressions and can be used in larger expressions themselves;
- Has first-class functions (that is, closures as values);
- Automatic data-typing and automatic memory management;
- With implementations on all major operating systems;
- Embedding code in strings ( interpolation );
- Supports **UTF-8**;
- Literal notation for arrays, hashes, regular expressions;
- Centralized package management through **[CPAN](http://www.cpan.org/)** or [MetaCPAN](https://metacpan.org/);
- Large standard library;
- **Open Source**.

> The Comprehensive Perl Archive Network carries a complete list of supported platforms with links to the distributions available on each. CPAN is also the source for publicly available Perl modules that are not part of the core Perl distribution.

## 1.6. Style Guides

## 1.7. Official Documentation

- [Perl Documentation](http://perldoc.perl.org/)

## 1.8. Other Sites

- [The Perl Foundation (TPF)](http://www.perlfoundation.org/) is dedicated to the advancement of the Perl programming language through open discussion, collaboration, design, and code. The Perl Foundation is a non-profit, 501(c)(3) organization based in Holland, Michigan;
- [Perl Mongers](http://www.pm.org/) was created in 1998 as a stand-alone organization by [brian d foy](https://en.wikipedia.org/wiki/Brian_d_foy) who formed the first Perl users group - the New York Perl Mongers, or NY.pm - in 1997 at the First O'Reilly Perl Conference along with other founding members including Piglet Evans, Adam Turoff and David H Adler. In 2000, Perl Mongers became part of The Perl Foundation where it continues its mission to organize and serve Perl user groups;
- [PerlMonks](http://www.perlmonks.org/) is a community website covering all aspects of Perl programming and other related topics such as web applications and system administration. It is often referred to by users as 'The Monastery'. The name PerlMonks, and the general style of the website, is designed to both humorously reflect the almost religious zeal that programmers sometimes have for their favorite language, and also to engender an atmosphere of calm reflection and consideration for other users.
