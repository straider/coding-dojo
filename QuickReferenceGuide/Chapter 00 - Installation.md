# Installation Guide

## Introduction

This document aims to be a quick step-by-step mini tutorial on how to install Python interpreters on distinct operation systems.

There 2 major versions to [chose from](https://wiki.python.org/moin/Python2orPython3), when installing Python.

> If you’re choosing a Python interpreter to use, and aren’t opinionated, then use the newest Python 3.x, since every version brings new and improved standard library modules, security and bug fixes. Progress is progress.

> Given such, only use Python 2 if there's a strong reason to, such as a Python 2 exclusive library which has no adequate Python 3 ready alternative, or there are strong reasons to dislike the language changes introduced by Python 3.

## Step by Step

After a successful installation it may be necesary to configure some environment variables:

- **PYTHONHOME**: By default, the libraries are searched in prefix/lib/pythonversion/ and exec_prefix/lib/pythonversion/, where prefix and exec_prefix are installation-dependent directories, both defaulting to /usr/local. When PYTHONHOME is set to a single directory, its value replaces both prefix and exec_prefix. To specify different values for these, set PYTHONHOME to prefix:exec_prefix;
- **PYTHONPATH**: In addition to normal directories, individual PYTHONPATH entries may refer to zipfiles containing pure Python modules ( in either source or compiled form ). Extension modules cannot be imported from zipfiles. An additional directory will be inserted in the search path in front of PYTHONPATH as described above under Interface options. The search path can be manipulated from within a Python program as the variable sys.path.

### Windows

- Download [CPython](https://www.python.org/downloads/), which is the main Python implementation, written in C. It compiles Python programs into intermediate bytecode, which is executed by the virtual machine. CPython is distributed with a large standard library written in a mixture of C and Python;
- Fix Environment Variables: add the path to [PYTHON_INSTALL_DIR] to a DEVKITS environment variable;
- Test by issuing the following command on a Command Prompt window:<br/>```python --version```.

To switch between versions 2 and 3 it's recommended to install [Python Launcher for Windows](https://bitbucket.org/vinay.sajip/pylauncher/downloads). The launcher supplies two executables: py.exe ( the console version ) and pyw.exe ( the GUI version ). The launcher is registered as the handler for .py ( console ) and .pyw ( GUI ) file extensions. When executing a script, the launcher looks for a Unix-style #! shebang line in the script. It recognizes executable names **python** ( system default python ), **python2** ( default Python 2 release ) and **python3** ( default Python 3 release ). 

```bash
py # executes default python interpreter
py -2 # executes Python 2 interpreter
py -3 # executes Python 3 interpreter
```

### Linux Ubuntu 14.04 LTS - Trusty Tahr

**Attention**: by default, an installation of Ubuntu 14.04 LTS already has both version of CPython: Python 2.7.6 and Python 3.4.0.

#### From Sources

```bash
cd tmp/
wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz
tar -zxvf Python-2.7.10.tgz
cd Python-2.7.10/

./configure
make
make install

wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz
tar -zxvf Python-3.4.3.tgz
cd Python-3.4.3/

./configure
make
make install
```

#### Ubuntu PPA

#### Virtual Python Environment builder

- [virtualenv](https://pypi.python.org/pypi/virtualenv)
- [virtualenvwrapper](https://bitbucket.org/dhellmann/virtualenvwrapper): The extensions include wrappers for creating and deleting virtual environments and otherwise managing your development workflow, making it easier to work on more than one project at a time without introducing conflicts in their dependencies;
- [virtualenv-burrito](https://github.com/brainsik/virtualenv-burrito): One command to have a working virtualenv + virtualenvwrapper environment;
- [pew](https://pypi.python.org/pypi/pew/): Python Env Wrapper is a set of tools to manage multiple virtual environments. The tools can create, delete and copy your environments, using a single command to switch to them wherever you are, while keeping them in a single (configurable) location.

#### Virtual PythonBrew / pyenv

- [pythonbrew](https://github.com/utahta/pythonbrew): Python Environment manager;
- [pyenv](https://github.com/yyuu/pyenv): Simple Python version management.

```bash
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# Load pyenv automatically by adding the following to ~/.bash_profile:
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

pyenv install --list

pyenv install 2.7.10
pyenv install 3.4.2
pyenv install jython-2.7.0
```

#### Virtual pythonz

- [pythonz](https://github.com/saghul/pythonz): Python installation manager supporting CPython, Stackless, PyPy and Jython.

### MacOS

## Variants

There are other interpreters, that are not covered on this mini installation guide:

- [jython](http://www.jython.org/): Jython is a Java implementation of Python that combines expressive power with clarity;
- [IronPython](http://ironpython.net/): IronPython is an open-source implementation of the Python programming language which is tightly integrated with the .NET Framework. IronPython can use the .NET Framework and Python libraries, and other .NET languages can use Python code just as easily;
- [PyPy](http://pypy.org/): PyPy is a fast, compliant alternative implementation of the Python language (2.7.8 and 3.2.5);
- [Stackless Python](http://www.stackless.com/): Stackless Python is an enhanced version of the Python programming language. It allows programmers to reap the benefits of thread-based programming without the performance and complexity problems associated with conventional threads. The micro-threads that Stackless adds to Python are a cheap and lightweight;
- [WinPython](http://winpython.github.io/): WinPython is a free open-source portable distribution of the Python programming language for Windows XP/7/8, designed for scientists, supporting both 32bit and 64bit versions of Python 2 and Python 3;
- [Portable Python](http://portablepython.com/): Portable Python is a Python programming language pre-configured to run directly on the Windows OS from any USB storage device, enabling you to have, at any time, a portable programming environment;
py -3- [Anaconda](https://store.continuum.io/cshop/anaconda/): Completely free enterprise-ready Python distribution for large-scale data processing, predictive analytics, and scientific computing;
- [ActivePython](http://www.activestate.com/activepython)
- [Enthought Canopy](https://www.enthought.com/products/epd/): Enthought Canopy is a comprehensive Python analysis environment that provides easy installation of the core scientific analytic and scientific Python packages, creating a robust platform you can explore, develop, and visualize on. In addition to its pre-built, tested Python distribution, Enthought Canopy has valuable tools for iterative data analysis, visualization and application development.

## Useful Eggs / Wheels

This is a list of wheels that are often installed on most Python development environments:

There is an official repository of wheels, called [PyPI](https://pypi.python.org/pypi). There are several useful package managers:

- [EasyInstall](https://pypi.python.org/pypi/wheel) is a package manager for Python that provides a standard format for distributing Python programs and libraries (based on the Python Eggs format). By default, EasyInstall looks in the Python Package Index (PyPI) for the desired packages and uses the metadata there to download and install the package and its dependencies; 
- [pip](https://pip.pypa.io/en/stable/): pip is a package management system used to install and manage software packages written in Python. Many packages can be found in the Python Package Index (PyPI). Python 2.7.9 and later (on the python2 series), and Python 3.4 and later include pip by default;
- [Python Package Manager](http://pypm.activestate.com/): Python Package Manager (PyPM) is a Python utility intended to simplify the tasks of locating, installing, upgrading and removing Python packages. It can determine if the most recent version of a software package is installed on a system, and can install or upgrade that package from a local or remote host. PyPM is non-free and may only be used with ActiveState's ActivePython distribution. PyPM uses "PyPM Repositories" collections of pre-compiled packages. These repositories contain a high variety of modules, published on PyPI;
- [conda](http://conda.pydata.org/): Conda is a cross-platform, Python-agnostic binary package manager. It is the package manager used by Anaconda installations, but it may be used for other systems as well. Conda makes environments first-class citizens, making it easy to create independent environments even for C libraries. Conda is written entirely in Python, and is BSD licensed open source.
