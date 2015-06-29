# Installation Guide

## Introduction

This document aims to be a quick step-by-step mini tutorial on how to install Go on distinct operation systems.

## Step by Step

### Windows 7 / 8

- Download [Go 1.4.2 amd64](https://storage.googleapis.com/golang/go1.4.2.windows-amd64.msi), which is an installer for Windows 64x bits;
- Fix environment variables:
  - %GOROOT%: set this to the folder where Go was installed;
  - %GOBIN%: set this to %GOROOT%\bin;
  - %GOPATH%: should be set to the folder where the Go workspace resides;
  - %PATH%: add %GOBIN% to %PATH%.
- Test by issuing the following command on a Command Prompt window:<br/>```go version```.

#### Notes

- To install Go from sources is necessary to have [TDM-GCC](http://tdm-gcc.tdragon.net/) installed first. TDM-GCC is a compiler suite for 32- and 64-bit Windows, based on the GNU toolchain;
- Environment variable GOPATH may not be optional, but so far there is no need to set it up.

### Linux Ubuntu 14.04 LTS - Trusty Tahr

Ubuntu does not ship with Go and latest version in official repository is 1.2.1. In order to install latest versions it's necessary to execute the set of commands, of one of the following options, in a terminal session.

After installing it's also necessary to fix some environment variables:

```bash
export GOROOT=/opt/go
export GOBIN=$GOROOT/bin
export PATH=$PATH:$GOBIN

sudo mkdir $GOROOT/gopkg
export GOPATH=$GOROOT/gopkg
export PATH=$PATH:$GOPATH/bin
```

#### From Binaries

```bash
cd /tmp
wget https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz
tar -C /opt -zxvf go1.4.2.linux-amd64.tar.gz
```

#### From Sources

```bash
cd /tmp
# git clone https://go.googlesource.com/go
# wget https://github.com/golang/go/archive/master.zip
wget https://storage.googleapis.com/golang/go1.4.2.src.tar.gz
tar -zxvf go1.4.2.src.tar.gz

cd go/src
./all.bash
mv /tmp/go /opt
```

#### Ubuntu Community PPA

```bash
sudo apt-get install software-properties-common
# sudo add-apt-repository ppa:gophers/go
# sudo add-apt-repository ppa:duh/golang
sudo add-apt-repository ppa:evarlast/golang1.4
sudo apt-get update

sudo apt-get install golang
```

**Note**: latest version in this PPA is 1.4.1.

#### gvm

Theres a tool to manage different versions of Go, called [GVM](https://github.com/moovweb/gvm). But this tool installs local versions of Go, instead of system wide versions. For system-wide version the best options are to install either from binaries or from sources, as described above.

```bash
# sudo apt-get install curl git mercurial make binutils bison gcc build-essential
sudo apt-get install bison
cd /tmp
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
# [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
source "$HOME/.gvm/scripts/gvm
gvm version
gvm listall

gvm list
gvm install go1
gvm use go1.4.2 [--default]
```

**Note**: there's another tool with the same name, to manage Groovy versions.

Besides gvm pkgset there are two other tools to manage packages: [**gpm**]((https://github.com/pote/gpm) and [**gvp**](https://github.com/pote/gvp).

```bash
cd /tmp
git clone https://github.com/pote/gvp.git && cd gvp
./configure && sudo make install
git clone https://github.com/pote/gpm.git && cd gpm
./configure && sudo make install
```

#### godeb

There's also another tool, [godeb](https://github.com/niemeyer/godeb), to manage the installation and switching of different versions of Go. After installing one of the binaries, 32 bit or 64 bit, then issue the following commands:

```bash
cd /tmp
# sudo apt-get install bzr
go get launchpad.net/godeb
sudo apt-get remove golang
sudo $GOPATH/bin/godeb install
```

These commands were taken from [How to install Go with GoDeb on Debian or Ubuntu](http://floaternet.com/golang/godeb) article.

### MacOS

## Variants

There's one known variant, that uses the GCC toolchain, called [gccgo](https://blog.golang.org/gccgo-in-gcc-471). GCCGO stands for [GNU Go Compiler](https://gcc.gnu.org/onlinedocs/gccgo/)

## Useful packages / libraries

