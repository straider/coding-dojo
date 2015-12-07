Quick Reference Guide
=====================

# 1. Introduction

An [Unix Shell](https://en.wikipedia.org/wiki/Unix_shell) is a command line interpreter of Unix commands.

> A shell hides the details of the underlying operating system and manages the technical details of the operating system kernel interface, which is the lowest-level, or "inner-most" component of most operating systems.

> The Unix shell is both an interactive command language as well as a scripting programming language, and is used by the operating system as the facility to control the execution of programs in the system.

> The typical Unix/Linux/Posix-compliant installation includes the [Korn Shell]((http://www.kornshell.org/)) (ksh) in several possible versions such as ksh88, ksh93 and others.

> The oldest shell still in common use is the Bourne shell (sh); Unix systems invariably include also the C Shell (csh), Bourne Again Shell (bash), a remote shell (rsh), a secure shell for SSL telnet connections (ssh), and a shell which is a main component of the Tcl/Tk installation usually called tclsh; wish is a GUI-based Tcl/Tk shell. Other shells available on a machine or available for download and/or purchase include ash, msh, ysh, zsh (a particularly common enhanced Korn Shell), the Tenex C Shell (tcsh), a Perl-like shell (psh) and others.

## 1.1. Roots

> The [Thompson shell](http://v6shell.org/) was the first Unix shell, introduced in the first version of Unix in 1971. It was a simple command interpreter, not designed for scripting, but nonetheless introduced several innovative features to the command-line interface and led to the development of the later Unix shells.

> The shell's design was intentionally minimalistic: even the if and goto statements, essential for control of program flow, were implemented as separate commands. As a result, by 1975, it was becoming clear that the Thompson shell was inadequate for most serious programming tasks.

> At this time, the developers of the Programmer's Workbench UNIX distribution, most notably John Mashey, began modifying the Thompson shell to make it more suitable for programming. The result, known as the PWB shell or the Mashey shell, included more advanced flow-control mechanisms and introduced shell variables, but remained limited by the necessity to remain compatible with the Thompson shell.

> Finally, the Thompson shell was replaced as the main Unix shell by the Bourne shell in Version 7 Unix and the C shell in 2BSD, both released in 1979.

## 1.2. History

[Historical](http://www.ibm.com/developerworks/library/l-linux-shells/) there are 4 generations of distinct shell functionalities:

- **1st Generation**: 
  - [Thomson shell](https://en.wikipedia.org/wiki/Thompson_shell), created by [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson) in 1971;
  - [Mashey shell](https://en.wikipedia.org/wiki/PWB_shell), created by John Mashey in 1975.
- **2nd Generation**: 
  - [Bourne shell](https://en.wikipedia.org/wiki/Bourne_shell), created by Stephen Bourne in 1977;
  - [C-shell](https://en.wikipedia.org/wiki/C_shell), created by Bill Joy in 1978.
- **3rd Generation**: 
  - [tcsh](https://en.wikipedia.org/wiki/Tcsh), created by Ken Greer in 1981;
  - [ksh88](https://en.wikipedia.org/wiki/Korn_shell), created by David Korn ni 1983;
  - [ash](https://en.wikipedia.org/wiki/Almquist_shell), created by Kenneth Almquist in 1989, as replacement to the traditional "System V Release 4" Bourne shell due to the license war between AT&T and Berkeley.
- **4th Generation**: 
  - [bash](https://en.wikipedia.org/wiki/Bash_Unix_shell), created by Brian Fox in 1989;
  - [zsh](https://en.wikipedia.org/wiki/Z_shell), created by Paul Falstad in 1990;
  - [ksh93](https://en.wikipedia.org/wiki/Korn_shell), created by Ken Greer in 1993 and released under Eclipse Public License since 2005;
  - [dash](http://gondor.apana.org.au/~herbert/dash/) is a POSIX-compliant implementation of /bin/sh that aims to be as small as possible. It does this without sacrificing speed where possible. In fact, it is significantly faster than bash (the GNU Bourne-Again SHell) for most tasks.
- **Next Generation**:
  - [fish](https://en.wikipedia.org/wiki/Friendly_interactive_shell), created by Axel Liljencrantz in 2005.

## 1.3. Authors

## 1.4. Why?

> 
- If cut wont cut it, try sed;
- If sed makes you sad, try awk;
- If awk becomes too awkward, try shell;
- If shell makes you yell, try perl or python or ruby;
- If perl or python or ruby won't shine, try C;
- If C can't see it, use assembly.

## 1.5. Features

## 1.6. Style Guides

- [BashGuide/Practices ](http://mywiki.wooledge.org/BashGuide/Practices)
- [Writing Robust Bash Shell Scripts](http://www.davidpashley.com/articles/writing-robust-shell-scripts/)
- [design patterns or best practices for shell scripts](http://stackoverflow.com/questions/78497/design-patterns-or-best-practices-for-shell-scripts/739034#739034)
- [10 good shell scripting practices](http://www.theunixschool.com/2012/03/10-good-shell-scripting-practices.html)
- [Best Practices for Writing Bash Scripts](http://kvz.io/blog/2013/11/21/bash-best-practices/)

## 1.7. Official Documentation

# 2. Variants

- [tcsh](http://www.tcsh.org) is an enhanced, but completely compatible version of the Berkeley UNIX C shell (csh);
- [KornShell](http://www.kornshell.org/) is an interactive command language that provides access to the UNIX system and to many other systems, on the many different computers and workstations on which it is implemented. The KornShell language is also a complete, powerful, high-level programming language for writing applications, often more easily and quickly than with other high-level languages. This makes it especially suitable for prototyping;
- [GNU Bash](https://www.gnu.org/software/bash/) is an sh-compatible shell that incorporates useful features from the Korn shell (ksh) and C shell (csh). It is intended to conform to the IEEE POSIX P1003.2/ISO 9945.2 Shell and Tools standard;
- [Zsh](http://www.zsh.org/) is a shell designed for interactive use, although it is also a powerful scripting language;
- [fish](http://fishshell.com/) is a smart and user-friendly command line
shell for OS X, Linux, and the rest of the family;
- [Scsh](http://scsh.net/) is an open-source Unix shell embedded within Scheme, running on all major Unix platforms including AIX, Cygwin, Linux, FreeBSD, GNU Hurd, HP-UX, Irix, Mac OS X, Solaris, and some others;
- [pl: Minimal Perl Shell](http://plshell.sourceforge.net/) is a minimal Perl shell, providing continuations of unterminated quotations, autoloading of functions, and the option to convert line-based data to arrays on-the-fly. Unlike psh, pl does not provide sh-like constructs; all commands are valid Perl;
- [Perl Shell](http://gnp.github.io/psh/) (psh) combines aspects of bash and other shells with the power of Perl scripting;
- [Xonsh](http://xonsh.org/) is a Python-ish, BASHwards-looking shell language and command prompt. The language is a superset of Python 3.4+ with additional shell primitives that you are used to from Bash and IPython. It works on all major systems including Linux, Mac OSX, and Windows;
- [rush](https://github.com/adamwiggins/rush) is a unix integration library and an interactive shell which uses pure Ruby syntax;
- [Shirt](https://github.com/jstorimer/shirt) is a simple Unix shell written in pure Ruby. It takes inspiration from bash and is written mostly for educational purposes;
- [Urchin](https://github.com/Spakman/urchin) does not aim to be POSIX compliant, but is heavily influenced by Bash
and Zsh. Urchin aims to make Ruby a first class citizen in the shell and be a
good place for experimenting with new shell ideas.
