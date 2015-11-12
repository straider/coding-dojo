:: GNU ::
=========

# 1. Introduction

This document aims to list the available environments and C compilers for Windows.

# 2. Environments

- [GnuWin](http://gnuwin32.sourceforge.net/) provides Win32-versions of GNU tools, or tools with a similar open source licence. The ports are native ports, that is they rely only on libraries provided with any standard 32-bits MS-Windows operating system;
- [GOW](https://github.com/bmatzelle/gow): Unix command line utilities installer for Windows. Gow (Gnu On Windows) is the lightweight alternative to Cygwin;
- [Cygwin](https://www.cygwin.com/) is a large collection of GNU and Open Source tools which provide functionality similar to a Linux distribution on Windows and a DLL (cygwin1.dll) which provides substantial POSIX API functionality;
  - [Babun](https://babun.github.io/) is a windows hosted linux-like shell. It offers a preconfigured Cygwin distribution where everything should work out of the box;
  - [MSYS2](https://msys2.github.io/): A Cygwin-derived software distro for Windows using Arch Linux's Pacman. MSYS2 is an independent rewrite of MSYS, based on modern Cygwin (POSIX compatibility layer) and MinGW-w64 with the aim of better interoperability with native Windows software.
- [MinGW](http://www.mingw.org/), a contraction of "Minimalist GNU for Windows", is a minimalist development environment for native Microsoft Windows applications;
  - [MSYS](http://www.mingw.org/wiki/MSYS)  is a collection of GNU utilities to allow building of applications and programs which depend on traditionally UNIX tools to be present. It is intended to supplement MinGW and the deficiencies of the cmd shell;
  - [Mingw-w64](http://mingw-w64.org/) is an advancement of the original mingw.org project, created to support the GCC compiler on Windows systems. It has forked it in 2007 in order to provide support for 64 bits and new APIs.
- [coLinux](http://www.colinux.org/) is the first working free and open source method for optimally running Linux on Microsoft Windows natively.
  - [andLinux](http://www.andlinux.org/) is a complete Ubuntu Linux system running seamlessly in Windows 2000 based systems (2000, XP, 2003, Vista, 7; 32-bit versions only).

# 3. Compilers

- [GCC](https://gcc.gnu.org/): The GNU Compiler Collection includes front ends for C, C++, Objective-C, Fortran, Java, Ada, and Go;
- [TDM-GCC](http://tdm-gcc.tdragon.net/about): combines the most recent stable release of the GCC toolset, a few patches for Windows-friendliness, and the free and open-source MinGW or MinGW-w64 runtime APIs to create an open-source alternative to Microsoft's compiler and platform SDK;
- [clang](http://clang.llvm.org/) is a C language family frontend for LLVM. The goal of the Clang project is to create a new C, C++, Objective C and Objective C++ front-end for the [LLVM](http://www.llvm.org/) compiler;
- [Tiny C Compiler](http://bellard.org/tcc/): TinyCC (aka TCC) is a small but hyper fast C compiler;
- [LCC](https://sites.google.com/site/lccretargetablecompiler/) is a retargetable compiler for Standard C.
