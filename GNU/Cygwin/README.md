:: GNU :: Cygwin ::
===================

# 1. Overview

This document acts as a quick guide for installing and using [Cygwin](https://www.cygwin.com/) on Windows 7 ( 32 bits ).

## 1.1. Goals & Objectives

> Cygwin is a Unix-like environment and command-line interface for Microsoft Windows. Cygwin provides native integration of Windows-based applications, data, and other system resources with applications, software tools, and data of the Unix-like environment. Thus it is possible to launch Windows applications from the Cygwin environment, as well as to use Cygwin tools and applications within the Windows operating context.

> Cygwin consists of two parts:
- a dynamic-link library (DLL) as an API compatibility layer providing a substantial part of the POSIX API functionality;
- and an extensive collection of software tools and applications that provide a Unix-like look and feel.

## 1.2. History

> Cygwin began in 1995 as a project of Steve Chamberlain.

> Cygwin was originally developed by Cygnus Solutions, which was later acquired by Red Hat. It is free and open source software, released under the GNU General Public License version 3. Today it is maintained by employees of Red Hat, NetApp and many other volunteers.

> Initially, Cygwin was called gnuwin32 (not to be confused with the current GnuWin32 project). The name was changed to Cygwin32 to emphasize Cygnus' role in creating it. When Microsoft registered the trademark Win32, the 32 was dropped to simply become Cygwin.

> In 1999, Cygnus offered Cygwin 1.0 as a commercial product of interest in its own right although subsequent versions have not been released, instead relying on continued open source releases.

Project Leaders:

- Geoffrey Noer was the project lead from 1996 to 1998;
- Christopher Faylor was the project lead from 1998 to mid-2014;
- Corinna Vinschen became co-lead since early 2004 and has been lead since mid-2014.

> Towards the end of 2011, [mintty](https://code.google.com/p/mintty/) became Cygwin's default terminal.

> Cygwin 1.7 introduced comprehensive support for POSIX locales and many character encodings, whereby the UTF-8 Unicode encoding became the default.

## 1.3. Caveats & Pitfalls

- Still using 32 bits, instead of 64 bits, even when host is Windows 7 64 bits;
- Distributing an application built on top of Cygwin requires distributing the run-time environment, **cygwin1.dll**.

> Cygwin comes with the MinGW libaries and headers, to allow compile without linking to the cygwin1.dll ( by using -mno-cygwin flag with gcc ).

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

There are several tools to handle package management:

- [setup](https://cygwin.com/faq/faq.html#faq.setup.cli): Cygwin Setup can handle command-line options and will work in GUI mode and use its current folder to download and install packages;
- [cyg-apt](https://code.google.com/p/cyg-apt/) is a command line package manager for Cygwin, similar to apt-get. It requires a base install of Cygwin, Cygwin Python and gnupg;
- [apt-cyg](http://github.com/transcode-open/apt-cyg), by Steven Penny, is a Cygwin package manager. It includes a command-line installer for Cygwin which cooperates with Cygwin Setup and uses the same repository;
  - [apt-cyg](https://github.com/wuyangnju/apt-cyg): The original [apt-cyg](https://code.google.com/p/apt-cyg/), which has been inactive for long, got some problems recently. This re-publish has solved these problems:
      - Cygwin has distinguished 64bit version from 32bit version, and so does the repositories;
      - Some packages(like python) have started using xz as its compressor rather than bzip2.
  - [apt-cyg](https://github.com/kou1okada/apt-cyg), by Stephen Jungels, is a command-line installer for Cygwin which cooperates with Cygwin Setup and uses the same repository. The syntax is similar to apt-get.
- [cyg-get](https://github.com/chocolatey/chocolatey-coreteampackages/tree/master/packages/cyg-get) is an utility that simplifies installing cygwin packages. The installation requires Chocolatey.

For compatibility reasons it is recommended to use Cygwin Setup, either in [32 bits](http://cygwin.com/setup-x86.exe) or [64 bits](http://cygwin.com/setup-x86_64.exe), to install the following packages:

```bash
cyg-setup=[ABSOLUTE_PATH_TO_CYGWIN_SETUP_FOLDER] # /cygdrive/c/.../setup-x86.exe
cyg-setup -q --packages=curl,wget,chere
```

### 2.3.1. Users & Groups

In previous versions it was necessary to create the groups and users manually. If the following message appears then execute the following commands in Cygwin Terminal:

> Your group is currently "mkgroup".  This indicates that
 the /etc/group (and possibly /etc/passwd) files should be rebuilt.

```bash
mkpasswd -l -d > /etc/passwd
mkgroup  -l -d > /etc/group
```

**Note**: option -d is necessary for domain users.

### 2.3.2. UTF-8

It was simply a matter of configuring the option Text on the Cygwin Terminal window.

### 2.3.3. BASH Prompt Here

After installing **chere** package then execute the following command in Cygwin Terminal:

```bash
chere -i -nf -t mintty
```

### 2.3.4. Proxy

### 2.3.5. Extra Packages

```bash
cyg-setup=[ABSOLUTE_PATH_TO_CYGWIN_SETUP_FOLDER] # /cygdrive/c/.../setup-x86.exe
cyg-setup -q --packages=mksh
```

**Note**: the file that configures the session for [MirBSD Korn Shell](https://www.mirbsd.org/mksh.htm) is .mkshrc instead of the usual .profile.
