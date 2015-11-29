:: GNU ::
=========

# 1. Introduction

This document acts as a quick guide for installing and using [MinGW](http://www.mingw.org/) on Windows 7 ( 32 bits and 64 bits ).

[MinGW](http://www.mingw.org/), a contraction of "Minimalist GNU for Windows", is a minimalist development environment for native Microsoft Windows applications;
  - [MSYS](http://www.mingw.org/wiki/MSYS)  is a collection of GNU utilities to allow building of applications and programs which depend on traditionally UNIX tools to be present. It is intended to supplement MinGW and the deficiencies of the cmd shell;
  - [Mingw-w64](http://mingw-w64.org/) is an advancement of the original mingw.org project, created to support the GCC compiler on Windows systems. It has forked it in 2007 in order to provide support for 64 bits and new APIs.

## 1.1. Goals & Objectives

> Although both Cygwin and MinGW can be used to port UNIX software to Windows, they have different approaches:

- Cygwin aims to provide a complete POSIX layer that provides emulations of several system calls and libraries that exist on Linux, UNIX, and the BSD variants;
- Unlike Cygwin, MinGW does not require a compatibility layer DLL and thus programs do not need to be distributed with run-time DLL. But because MinGW is dependent upon Windows API calls, it cannot provide a full POSIX API; it is unable to compile some UNIX applications that can be compiled with Cygwin.

## 1.2. History

> MinGW (Minimalist GNU for Windows) was created by Colin Peters. Colin used Cygwin 1.3.3 suite to compile the first version of the MinGW compiler code and had made it available on his website.

> The very first native MinGW compiler was provided by Jan-Jaap van der Heijden.

> Mumit Khan took the baton and over a couple of following years has been doing great work of maintenance and development of MinGW.

## 1.3. Caveats & Pitfalls

- Up to version 1.0.11 there's only a 32 bits choice, instead of 64 bits, even when host is Windows 7 64 bits;
- It runs on top of Command Prompt window, instead of [mintty](https://code.google.com/p/mintty/) by default.

# 2. Installation Steps

This guide is based on [MinGW/MSYS development environment](http://ingar.satgnu.net/devenv/mingw32/).

## 2.1. Pre-Requirements

- Download latest version of [mingw-get-setup.exe](http://sourceforge.net/projects/mingw/files/latest/download?source=files);
- Optionally, download the latest version of [MinGW-w64 installer](https://sourceforge.net/projects/mingw-w64/files/latest/download?source=files);
- Fresh installation size: +335 MB.

## 2.2. Installation

### 2.2.1. MinGW

Install MinGW into C:\Hosting\MinGW\:

- Execute mingw-get-setup.exe
  - Specify Installation Directory: C:\Hosting\MinGW\
- Use the MinGW Installation Manager, **mingw-get**, to install the MSYS packages:
  - Select Basic Setup on the left side of the screen. Mark the following packages to install:
      - mingw-developer-toolkit
      - msys-base
      - mingw32-base ( with GCC )
  - Install a number of additional packages by selecting All Packages on the left side of the screen. Mark the following packages for installation:
      - msys-mintty
      - msys-mksh
      - ~~msys-rxvt~~ ( mintty is better )
      - msys-unzip
      - msys-wget
      - msys-zip
- Create a new shortcut to launch the MSYS shell.

It's necessary to edit **/ect/fstab** file and add the following line:

```
C:\Hosting\MinGW  /mingw
```

### 2.2.1. MinGW-W64

To install MinGW-W64 on top of MinGW:

- Cleanup after the MinGW Installation Manager:rename mingw32/ sub-folder to mingw32.original/
- Execute **mingw-w64-install.exe**

## 2.3. Configuration

To open terminal with mintty edit **msys.bat**, in C:\Hosting\MinGW\msys\, and replace line with ```set MSYSCON=unknown``` with ```set MSYSCON=mintty.exe```.

Then, after opening the terminal, configure options:

- Configure Text:
  - Font as Consolas or Lucinda Console, size 9 points;
  - Locale as C;
  - Character Set as UTF-8 ( Unicode ).
- Configure Window:
  - Size 120 columns and 50 rows.

### 2.3.1. Users & Groups

### 2.3.2. UTF-8

It was simply a matter of configuring the option Text on the MinGW Terminal window.

### 2.3.3. BASH Prompt Here

### 2.3.4. Proxy

### 2.3.5. Extra Packages
