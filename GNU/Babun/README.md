:: GNU :: Babun ::
==================

# 1. Overview

This document acts as a quick guide for installing and using [Babun](https://babun.github.io/) on Windows 7 ( 32 bits ).

## 1.1. Goals & Objectives

Babun features the following:

- Pre-configured Cygwin with a lot of addons;
- Silent command-line installer, no admin rights required;
- **pact** - advanced package manager (like apt-get or yum);
- xTerm-256 compatible console;
- HTTP(s) proxying support;
- Plugin-oriented architecture;
- Pre-configured git and shell;
- Integrated oh-my-zsh;
- Auto update feature;
- "Open Babun Here" context menu entry.

The default terminal emulator is [mintty](https://code.google.com/p/mintty/).

## 1.2. History

## 1.3. Caveats & Pitfalls

- Babun officially lacks 64-bit support;
- The installation requires Internet connectivity;
- The default Shell is zsh instead of bash.

# 2. Installation Steps

## 2.1. Pre-Requirements

- Fresh installation size: +700 MB;
- Internet connectivity.

## 2.2. Installation

Install Babun into C:\Hosting\babun\, by uncompressing the ZIP file to a temporary folder and then by executing the following command on a Command Prompt window: ```install.bat /t "C:\Hosting\babun"```.

## 2.3. Configuration

The Babun Terminal window, similar to the Cygwin Terminal window, offers a configuration dialog, where one should:

- Configure Text:
  - Font as Consolas or Lucinda Console, size 9 points;
  - Locale as C;
  - Character Set as UTF-8 ( Unicode ).
- Configure Window:
  - Size 120 columns and 50 rows.

### 2.3.1. Users & Groups

### 2.3.2. UTF-8

It was simply a matter of configuring the option Text on the Babun Terminal window.

### 2.3.3. BASH Prompt Here

It is installed by default.

> The zsh ( with .oh-my-zsh ) is the default babun's shell. Executing the following command will output the default shell:

```bash
babun shell
```

In order to change the default shell execute:

```bash
babun shell /bin/bash
```

The output contains two lines: the previous default shell and the new default shell.

### 2.3.4. Proxy

> Babun supports HTTP proxying out of the box. Just add the address and the credentials of your HTTP proxy server to the .babunrc file located in your home folder and execute source .babunrc to enable HTTP proxying. SOCKS proxies are not supported for now.

> To setup proxy uncomment following lines in the .babunrc file ( %USERPROFILE%\.babun\cygwin\home\USER\.babunrc ):

```bash
export http_proxy=http://user:password@server:port
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export no_proxy=localhost
```
