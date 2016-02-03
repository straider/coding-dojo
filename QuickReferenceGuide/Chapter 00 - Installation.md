# Installation Guide

## Introduction

This document aims to be a quick step-by-step mini tutorial on how to install Perl interpreters on distinct operation systems.

## Step by Step

### Windows 7 / 8

- Download the latest version of [Strawberry Perl](http://strawberryperl.com/) or [ActivePerl](http://www.activestate.com/activeperl/downloads);
- Follow the installation wizard.

**Note**: [DWIM Perl for Windows](http://dwimperl.com/windows.html) is a Strawberry Perl derivative for Windows.

**Note**: There's a tool similar to perlbrew, but for Windows: [berrybrew](https://github.com/dnmfarrell/berrybrew) is written in C# and it can download, install, remove and manage multiple concurrent versions of Strawberry Perl for Windows:

```bash
git clone https://github.com/sillymoose/berrybrew
cd berrybrew
mcs src/berrybrew.cs -lib:lib -r:ICSharpCode.SharpZipLib.dll -out:bin/berrybrew.exe
cd bin
berrybew config
```

### Linux Ubuntu 14.04 LTS - Trusty Tahr

Ubuntu 14.04 ships with Perl 5.18.2.

#### From Binaries

- Download the latest version of [ActivePerl](http://www.activestate.com/activeperl/downloads);
- Follow the installation wizard.

#### From Sources

```bash
cd tmp
wget http://www.cpan.org/src/5.0/perl-5.22.1.tar.gz
tar -zxvf perl-5.22.1.tar.gz
cd perl-5.22.1
./Configure -Dusethreads -des -Dprefix=$HOME/opt/perl
make && make test && make install
```

**Note**: It may be useful to use [perlbrew](http://perlbrew.pl/) or [plenv](https://github.com/tokuhirom/plenv) to help build Perl from sources and manage different versions.

#### Ubuntu PPA

#### perlbrew

```bash
curl -kL http://xrl.us/perlbrewinstall | bash
echo source ~/perl5/perlbrew/etc/bashrc >> $HOME/.bashrc
perlbrew init
perlbrew mirror
perlbrew available

perlbrew install perl-5.22.1
```

#### plenv

```bash
git clone https://github.com/tokuhirom/plenv.git ~/.plenv
echo 'export PATH="$HOME/.plenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(plenv init -)"' >> ~/.bash_profile
exec $SHELL -l

git clone https://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/

plenv install 5.22.1
plenv rehash
```

Instead of ```git``` one can download the latest version, unpack it and install it by following these commands:

```bash
cd $HOME
wget -O plenv.tar.gz https://github.com/tokuhirom/plenv/archive/master.tar.gz
mkdir ~/.plenv
tar --directory=~/.plenv --strip-components=1 -zxvf plenv.tar.gz
```

### MacOS

## Variants

- [PLJava](http://search.cpan.org/~gmpassos/PLJava/) is a project to embed Perl into Java;
- [Inline::Java](http://search.cpan.org/~etj/Inline-Java/) module allows Java source code directly "inline" in a Perl script or module;
- [jerl](https://github.com/mtshomsky/jerl) allows perl to run within the JVM (not having to access any external libs);
- [perljvm](http://www.ebb.org/perljvm/) is a project with the goal to support the Perl language natively on the JVM without needing the C perl system around.
