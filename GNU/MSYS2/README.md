:: GNU :: MSYS2 ::
==================

# 1. Overview

This document acts as a quick guide for installing and using [MSYS2](https://msys2.github.io/) on Windows 7 ( 64 bits ).

## 1.1. Goals & Objectives

> MSYS2 is an independent rewrite of MSYS, based on modern Cygwin (POSIX compatibility layer) and MinGW-w64 with the aim of better interoperability with native Windows software.

> The name is a contraction of Minimal SYStem 2, and aims to provide support to facilitate using the bash shell, Autotools, revision control systems and the like for building native Windows applications using MinGW-w64 toolchains.

The default terminal emulator is [mintty](https://code.google.com/p/mintty/).

> MSYS2 provies a minimal shell required to run autotools and other build systems which get the source for software from the Internet from different repositories, configure them and build them. The shell and core tools exist mainly to allow porting Unix programs to run natively on Windows (i.e. without requiring a POSIX emulation layer). MSYS2 doesn't try to duplicate Cygwin's efforts more than necessary, so the number of provided POSIX-emulated software is very small.

## 1.2. History

> MSYS2 is ideologically a successor to MSYS, which is again a Cygwin fork that optionally accompanies the mingw.org compiler toolchain. MSYS -- although definitely useful -- is really old and getting in the way of developers. MSYS2 was created to replace the original MSYS while avoiding its problems.

## 1.3. Caveats & Pitfalls

> Cygwin provides a runtime library called cygwin1.dll that provides the POSIX compatibility layer where necessary. The MSYS2 variant of this library is called msys-2.0.dll.

# 2. Installation Steps

## 2.1. Pre-Requirements

- Fresh installation size: +175 MB;
- Size after first update: +200 MB;
- Size after second update: +210 MB;
- Internet connectivity, for post-installation steps.

## 2.2. Installation

Install MSYS2 into C:\Hosting\msys2\.

Open MSYS2 Shell window and execute the following commands:

```bash
pacman -Sy
pacman —needed -S bash pacman pacman-mirrors msys2-runtime
```

The recent versions offer an update-core script, which is easier. Open MSYS2 Shell window and execute the following commands:

```bash
update-core
```

Exit from MSYS2 Shell window and re-open it to execute the following commands:

```bash
pacman -Su
```

## 2.3. Configuration

The MSYS2 Shell window, similar to the Cygwin Terminal window, offers a configuration dialog, where one should:

- Configure Text:
  - Font as Consolas or Lucinda Console, size 9 points;
  - Locale as C;
  - Character Set as UTF-8 ( Unicode ).
- Configure Window:
  - Size 120 columns and 50 rows.

> > MSYS2 uses Pacman (of Arch Linux) to manage its packages and comes with three different package repositories:
- msys2: Containing MSYS2-dependent software;
- mingw64: Containing 64-bit native Windows software (compiled with mingw-w64 x86_64 toolchain);
- mingw32: Containing 32-bit native Windows software (compiled with mingw-w64 i686 toolchain).

It's possible to make a backup of all installed packages, for future re-installation purposes. Use the following commands to create a list of installed packages and to re-install them all:

```bash
pacman -Qqe | xargs echo > [BACKUP_FOLDER]/packages.txt ; exit

pacman -S --needed --force $(cat [BACKUP_FOLDER]/packages.txt)
```

Where [BACKUP_FOLDER] stands for the full path of the folder that will keep the file with the list of installed packages.

### 2.3.1. Users & Groups

### 2.3.2. UTF-8

It was simply a matter of configuring the option Text on the MSYS2 Shell window.

### 2.3.3. BASH Prompt Here

### 2.3.4. Proxy

### 2.3.5. Extra Packages

```bash
pacman -S --needed --force wget mksh
```

**Note**: the file that configures the session for [MirBSD Korn Shell](https://www.mirbsd.org/mksh.htm) is .mkshrc instead of the usual .profile.
