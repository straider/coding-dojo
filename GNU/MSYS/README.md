:: GNU :: MSYS ::
=================

# 1. Overview

This document acts as a quick guide for installing and using [MSYS](http://www.mingw.org/wiki/MSYS) on Windows 7 ( 32 bits ).

> Minimal SYStem is a minimal POSIX system used in the Win32 OS to accomplish configuration and making of packages.

> MSYS is a fork of Cygwin and is more friendly to the Win32 user.  It offers only a user land environment for MinGW development.  It converts posix paths before executing a "native" win32 program.  This allows the users of the MinGW version of GCC to port and build packages in a GNU familiar way and removes the UNIX complexities that Cygwin adds.

## 1.1. Goals & Objectives

## 1.2. History

> MinGW (Minimalist GNU for Windows) was created by Colin Peters. Colin used Cygwin 1.3.3 suite to compile the first version of the MinGW compiler code and had made it available on his website.

> The very first native MinGW compiler was provided by Jan-Jaap van der Heijden.

> Mumit Khan took the baton and over a couple of following years has been doing great work of maintenance and development of MinGW.

## 1.3. Caveats & Pitfalls

- Up to version 1.0.11 there's only a 32 bits choice, instead of 64 bits, even when host is Windows 7 64 bits;
- It runs on top of Command Prompt window, instead of [mintty](https://code.google.com/p/mintty/) by default.

> Although both Cygwin and MinGW can be used to port UNIX software to Windows, they have different approaches:

- Cygwin aims to provide a complete POSIX layer that provides emulations of several system calls and libraries that exist on Linux, UNIX, and the BSD variants;
- Unlike Cygwin, MinGW does not require a compatibility layer DLL and thus programs do not need to be distributed with run-time DLL. But because MinGW is dependent upon Windows API calls, it cannot provide a full POSIX API; it is unable to compile some UNIX applications that can be compiled with Cygwin.

# 2. Installation Steps

## 2.1. Pre-Requirements

- Fresh installation size: +35 MB.

## 2.2. Installation

Install MSYS into C:\Hosting\msys1\:

- Execute: ```MSYS-1.0.11.exe``` to install Minimal SYStem;
- Execute: ```msysDTK-1.0.1.exe``` to install MSYS Developer Tool Kit;
- Uncompress: ```msysCORE-1.0.11-bin.tar.gz```

## 2.3. Configuration

Last installation step is a post install that opens a Command Line window. It will ask several questions:

```
This is a post install process that will try to normalize between
your MinGW install if any as well as your previous MSYS installs
if any.  I don't have any traps as aborts will not hurt anything.
Do you wish to continue with the post install? [yn ] y

Do you have MinGW installed? [yn ] n

When you install MinGW I suggest you install it to C:/mingw
(replace C: with the drive of your choice).  Then create an
/etc/fstab file with a line that has a value similar to:
C:/mingw /mingw
```

To open terminal with mintty edit **msys.bat**, in C:\Hosting\msys1\, and replace line with ```set MSYSCON=unknown``` with ```set MSYSCON=mintty.exe```.

Then, after opening the terminal, configure options:

- Configure Text:
  - Font as Consolas or Lucinda Console, size 9 points;
  - Locale as C;
  - Character Set as UTF-8 ( Unicode ).
- Configure Window:
  - Size 120 columns and 50 rows.

### 2.3.1. Users & Groups

### 2.3.2. UTF-8

It was simply a matter of configuring the option Text on the MSYS Terminal window.

### 2.3.3. BASH Prompt Here

### 2.3.4. Proxy

### 2.3.5. Extra Packages
