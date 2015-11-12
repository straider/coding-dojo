:: GNU :: MSYS2 ::
==================

# 1. Overview

This document acts as a quick guide for installing and using [MSYS2](https://msys2.github.io/) on Windows 7 ( 64 bits ).

## 1.1. Goals & Objectives

> MSYS2 is an independent rewrite of MSYS, based on modern Cygwin (POSIX compatibility layer) and MinGW-w64 with the aim of better interoperability with native Windows software.

> The name is a contraction of Minimal SYStem 2, and aims to provide support to facilitate using the bash shell, Autotools, revision control systems and the like for building native Windows applications using MinGW-w64 toolchains.

The default terminal emulator is [mintty](https://code.google.com/p/mintty/).

## 1.2. History

## 1.3. Caveats & Pitfalls

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

### 2.3.1. Users & Groups

### 2.3.2. UTF-8

It was simply a matter of configuring the option Text on the MSYS2 Shell window.

### 2.3.3. BASH Prompt Here
