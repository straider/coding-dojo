# Groovy Installation Guide

## Introduction

## Step by Step

### Windows 7 / 8

- Download an [installer](http://groovy-lang.org/download.html#distro);
- Add a **GROOVY_HOME** Environment Variable;
- Fix the **PATH** Environment Variable;
- Execute the command ```groovy -version``` to validate the installation.

#### posh-gvm

This tool, **[GVM for Powershell](https://github.com/flofreud/posh-gvm)**, is a clone of the GVM CLI. In most aspects its an 1:1 copy of the BASH based version. To install open a [PowerShell 3.0](https://www.microsoft.com/en-us/download/details.aspx?id=34595) command prompt and issue the following commands:

```bash
(new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/flofreud/posh-gvm/master/GetPoshGvm.ps1') | iex
Import-Module posh-gvm # best add it to profile.ps1
```

If PsGet is installed then these commands are all that is required:

```bash
Install-Module posh-gvm
Import-Module posh-gvm # best add it to profile.ps1
```

**Note**: the above commands require a PowerShell profile. Usually, by default, there are no profiles and one has to be created. There are several [types of profiles](http://blogs.technet.com/b/heyscriptingguy/archive/2012/05/21/understanding-the-six-powershell-profiles.aspx), but for a CurrentUser CurrentHost profile just issue these next commands on a PowerShell prompt:

```bash
Test-Path $profile           # If it returns False then issue the next command.
New-Item $profile -ItemType File -Force
$PROFILE | Format-List * -Force
```

To install PsGet just issue these commands:

```bash
(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
```

The file **Microsoft.PowerShell_profile.ps1** should look like this:

```bash
powershell_ise.exe $profile  # To edit the Microsoft.PowerShell_profile.ps1
Import-Module PsGet
Import-Module posh-gvm
```

#### Notes

On Windows 64x bits it may be necessary to also fix the **JAVA_HOME** Environment Variable, making it local to user instead of system-wide.

### Linux Ubuntu 14.04 LTS - Trusty Tahr

It seems that Groovy 2.4.3 does not work well with OpenJDK ( 6 or 7 ) and therefor it's required to install Oracle JDK 7. It's also necessary to fix JAVA_HOME Environment Variable, setting it to /usr/lib/jvm/java-7-oracle/.

#### From Sources

#### Ubuntu PPA

#### GVM

This tool, **[GVM](http://gvmtool.net/)**, makes installing Groovy on any Bash platform ( Mac OSX, Linux, Cygwin, Solaris or FreeBSD ) very easy. Simply open a new terminal and enter:

```bash
curl -s get.gvmtool.net | bash
source "$HOME/.gvm/bin/gvm-init.sh"
gvm version
gvm list groovy

gvm install groovy 2.4.3
gvm use groovy 2.4.3
groovy -version
```

**Attention**: there's a conflict between this tool - **Groovy enVironment Manager** - and a similar tool with same name for Go - **Go Version Manager**. They both are gvm and require a .gvm in $HOME.

### MacOS

## Variants

## Useful libraries / packages
