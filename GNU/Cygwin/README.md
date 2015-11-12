:: GNU :: Cygwin ::
===================

# 1. Overview

This document acts as a quick guide for installing and using [Cygwin](https://www.cygwin.com/) on Windows 7 ( 32 bits ).

## 1.1. Goals & Objectives

> Cygwin is a Unix-like environment and command-line interface for Microsoft Windows. Cygwin provides native integration of Windows-based applications, data, and other system resources with applications, software tools, and data of the Unix-like environment. Thus it is possible to launch Windows applications from the Cygwin environment, as well as to use Cygwin tools and applications within the Windows operating context.

> Cygwin consists of two parts:
- a dynamic-link library (DLL) as an API compatibility layer providing a substantial part of the POSIX API functionality;
- and an extensive collection of software tools and applications that provide a Unix-like look and feel.

The default terminal emulator is [mintty](https://code.google.com/p/mintty/).

## 1.2. History

> Cygwin began in 1995 as a project of Steve Chamberlain.

> Cygwin was originally developed by Cygnus Solutions, which was later acquired by Red Hat. It is free and open source software, released under the GNU General Public License version 3. Today it is maintained by employees of Red Hat, NetApp and many other volunteers.

> Initially, Cygwin was called gnuwin32 (not to be confused with the current GnuWin32 project). The name was changed to Cygwin32 to emphasize Cygnus' role in creating it. When Microsoft registered the trademark Win32, the 32 was dropped to simply become Cygwin.

## 1.3. Caveats & Pitfalls

- Still using 32 bits, instead of 64 bits, even when host is Windows 7 64 bits.

# 2. Installation Steps

## 2.1. Pre-Requirements

- Fresh installation size: +100 MB.

## 2.2. Installation

Install Cygwin using setup-x32.exe into C:\Hosting\Cygwin\.

## 2.3. Configuration

After installation is complete then open a Cygwin Terminal window. The first time it executes it will create a HOME folder with default dotfiles:

```
Copying skeleton files.
These files are for the users to personalise their cygwin experience.

They will never be overwritten nor automatically updated.

'./.bashrc' -> '/home/[USER]//.bashrc'
'./.bash_profile' -> '/home/[USER]//.bash_profile'
'./.inputrc' -> '/home/[USER]//.inputrc'
'./.profile' -> '/home/[USER]//.profile'
```

The Cygwin Terminal window offers a configuration dialog, where one should:

- Configure Text:
  - Font as Consolas or Lucinda Console, size 9 points;
  - Locale as C;
  - Character Set as UTF-8 ( Unicode ).
- Configure Window:
  - Size 120 columns and 50 rows.

### 2.3.1. Users & Groups

### 2.3.2. UTF-8

It was simply a matter of configuring the option Text on the Cygwin Terminal window.

### 2.3.3. BASH Prompt Here
