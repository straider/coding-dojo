# Installation Guide

## Introduction

Today, there are basically 2 compilers to choose from:

- [Free Pascal](http://www.freepascal.org/): Free Pascal is a 32, 64 and 16 bit professional Pascal compiler. It can target multiple processor architectures: Intel x86, AMD64/x86-64, PowerPC, PowerPC64, SPARC, and ARM. Supported operating systems include Linux, FreeBSD, Haiku, Mac OS X/iOS/Darwin, DOS, Win32, Win64, WinCE, OS/2, MorphOS, Nintendo GBA, Nintendo DS, and Nintendo Wii. Additionally, support for the JVM, MIPS (big and little endian variants), i8086, Motorola 68k and AArch64 architectures is available in the development versions.
- [GNU Pascal](http://www.gnu-pascal.de/gpc/h-index.html): The GNU Pascal Compiler (GPC) is, as the name says, the Pascal compiler of the [GNU family](http://www.gnu.org/software/gcc/). This means: GPC is a 32/64 bit compiler; does not have limits like the 64 kB or 640 kB limit known from certain operating systems; runs on all operating systems supported by GNU C.

This installation guide focus only on Free Pascal.

## Step by Step

### Windows 7 / 8

- Download [Free Pascal](http://www.freepascal.org/) ( [32](http://www.freepascal.org/down/i386/win32.var) and [64](http://www.freepascal.org/down/x86_64/win64.var) bit ) latest versions;
- Install 32 bit version;
- Install 64 bit version ( optionally );
- Fix Environment Variables: add the path to [PASCAL_INSTALL_DIR] to a DEVKITS environment variable;
- Test by issuing the following command on a Command Prompt window:<br/>```fpc --version```;
- Free Pascal also install a small IDE but if desired there's also a great IDE for it: [Lazarus IDE](http://www.lazarus-ide.org/).

**Note**: even if the operating system is 64 bit it is necessary to install the 32 bit version of Free Pascal Compiler;

### Linux Ubuntu 14.04 LTS - Trusty Tahr

Ubuntu latest version, of Free Pascal and Lazarus IDE, is behind latest versions:

- Free Pascal Compiler: should be 2.6.4 but is 2.6.2;
- Lazarus IDE: should be 1.4.0 but it is 1.0.10.

#### From Binaries

- Download Free Pascal ( [32](http://www.freepascal.org/down/i386/linux.var) or [64](http://www.freepascal.org/down/x86_64/linux.var) bit ) latest versions;
- Execute the following commands:

```bash
cd /tmp
tar -xvf fpc-2.6.4.[CPU]-linux.tar
cd fpc-2.6.4.[CPU]-linux
./install.sh

cd $HOME/fpc-2.6.4/bin
fpc -h
```

**Note**: it will install to $HOME/fpc-2.6.4/ and because of that it will be necessary to add $HOME/fpc-2.6.4/bin/ folder to the PATH Environment Variable.

#### From Sources

- Download Free Pascal latest [sources](http://www.freepascal.org/down/source/sources.var);
- Execute the following commands:

```bash
cd /tmp
tar -zxvf fpc-2.6.4.source.tar.gz
cd fpc-2.6.4
make all
make zipinstall
tar -zxvf fpc-2.6.4.[CPU]-linux.tar.gz -C [PASCAL_INSTALL_DIR]

cd [PASCAL_INSTALL_DIR]/bin
fpc -h
```

**Note**: it will be necessary to add the [PASCAL_INSTALL_DIR]/bin/ folder to the PATH Environment Variable.
 
#### Ubuntu PPA

```bash
sudo apt-get install fpc
```

### MacOS

## Variants

There are other Pascal Compilers, for Windows and Linux:

- [GPC](http://www.gnu-pascal.de/gpc/h-index.html): GNU Pascal
- [Turbo Pascal 7](http://techapple.net/2014/04/turbo-pascal-7-windows-7-windows-8-8-132bit-64bit-fullscreen-single-installer/)
- [Nemesis Pascal](http://npascal.sourceforge.net/)
- [P4 Pascal](http://homepages.cwi.nl/~steven/pascal/)

And there are other Pascal IDEs, besides and Lazarus:

- [FPS](http://ims.mii.lt/fps/en/about/index.html): FPS is system consisting from graphical user interface and integrated Free Pascal compiler;
- [Dev-Pascal](http://bloodshed.net/devpascal.html): Dev-Pascal is a full-featured integrated development environment (IDE), which is able to create Windows or console-based Pascal programs using the Free Pascal or GNU Pascal compilers;
- [MSEide + MSEgui](http://mseide-msegui.sourceforge.net/): MSEide is a Rapid Application Development IDE for platform independent rich GUI applications in the Pascal language. It comes with its own GUI toolkit called MSEgui, which ensures programs are portable. MSEgui has identical look and feel on all supported platforms, the look of the widgets is highly configurable. The widgetset library is completely written in Pascal and links directly to xlib on Linux and to gdi32 on win32;
- [ideU](https://github.com/fredvs/ideU): Multi OS, multi languages, multi compilers. ideU is derived from MSEide by Martin Schreiber;
- [Tabitha](http://coderesearchlabs.com/tabitha/): Tabitha is a Windows portable editor for FreePascal;
- [CodeTyphon](http://www.pilotlogic.com/sitejoom/index.php/codetyphon): CodeTyphon has
  - Typhon V-IDE ( Visual Integrated Development Environment );
  - FreePascal Compiler;
  - Tools;
  - Free Components packages;
  - Free Libraries;
  - Tons of samples;
  - is Free and Open-Source.
