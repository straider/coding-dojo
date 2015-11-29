coding-dojo / benchmarking / SFTP / Python
==========================================

# 1. Introduction

Personal Coding Dojo for benchmarking of several technologies while transfering files to and from a [SSH](https://en.wikipedia.org/wiki/Secure_Shell) server, using Python technology ( for client and server ).

## 1.1. Goal and Objectives

- Learn how to code SSH clients and SSH servers, in Python;
- Register installation and configuration steps for each choice;
- Measure performance between different implementations;
- Compare technology support for SSH file transfer operations ( put / get ) from best of breed 3rd party vendor ( FLOSS ).

## 1.2. Constraints

- Compilers and code should have no optimization features turned on;
- Must follow procedural paradigm, without using - as much as possible - classes or functional logic or specific language constructs.

# 2. Python / Jython

It's assume that the working environment, either in Windows or Linux, is configured:

- In Windows: %PATH% points to the libraries folder, such as C:\DevKits\Libraries\, and Visual C++ for Python 2.7.10 command prompt is set with:

```bash
set DISTUTILS_USE_SDK=1
set MSSdk=1
```

- In Linux: $PACKAGES_FOLDER points to a folder that contains all the necessary tarballs, such as $HOME/var/packages/python, and the following environment variables are set:

```bash
export CPATH=$CPATH:$HOME/include
export LIBRARY_PATH=$LIBRARY_PATH:$HOME/lib
```

## 2.1. FTP

- [ftplib](https://docs.python.org/2/library/ftplib.html) is part of the Standard Library and implements the client side of the FTP protocol;
- [Python FTP server library](https://github.com/giampaolo/pyftpdlib) provides a high-level portable interface to easily write very efficient, scalable and asynchronous FTP servers with Python. It is the most complete RFC-959 FTP server implementation available for Python programming language.

## 2.2. SFTP

- ~~[PycURL](http://pycurl.sourceforge.net/) is a Python interface to libcurl~~;
- libssh / libssh2:
  - [PySSH](http://pyssh.sourceforge.net/) is a Python library for programmatically controlling ssh and scp;
  - ~~[PySecure](https://github.com/dsoprea/PySecure) is a complete Python SSH/SFTP library based on libssh~~;
  - ~~[pylibssh2](https://github.com/wallix/pylibssh2) is python bindings for libssh2 library~~.
- [openssh-wrapper](https://pypi.python.org/pypi/openssh-wrapper) is a simple wrapper around OpenSSH ssh command-line utility;
- [paramiko](https://github.com/paramiko/paramiko) it's a module for python 2.6+ that implements the SSH2 protocol for secure (encrypted and authenticated) connections;
  - [ssh](https://github.com/bitprophet/ssh/) started life as a fork of Paramiko but has now been fully merged back upstream;
  - [pysftp](https://pypi.python.org/pypi/pysftp) is a simple interface to SFTP, based on zeth’s ssh.py;
  - [spur.py](https://github.com/mwilliamson/spur.py) runs commands and manipulate files locally or over SSH using the same interface. Spur is a thin wrapper around paramiko, aiming to provide a simpler API than paramiko for common SSH operations;
  - [sshstdlib](https://github.com/stestagg/sshstdlib) is a standard library emulation layer over SSH that uses paramiko;
  - [Exscript](https://github.com/knipknap/exscript) is a Python module making Telnet and SSH easy, on top of paramiko.
  - [pysftpserver](https://github.com/unbit/pysftpserver) is an OpenSSH SFTP wrapper in Python;
  - [sftpserver](https://pypi.python.org/pypi/sftpserver) is a simple single-threaded SFTP server based on Paramiko’s SFTPServer.
- [Fabric](http://www.fabfile.org/) is a Python library and command-line tool for streamlining the use of SSH for application deployment or systems administration tasks;
- [Python SFTP Client](https://github.com/cis-yogesh/Python_sftp_client)
- [AsyncSSH](https://pypi.python.org/pypi/asyncssh) is a Python package which provides an asynchronous client and server implementation of the SSHv2 protocol on top of the Python 3.4+ asyncio framework;

[SSHLibrary](https://github.com/robotframework/SSHLibrary): is a [Robot Framework](http://robotframework.org/) test library for SSH and SFTP.

### 2.2.1. libcURL

#### 2.2.1.1. Required libraries in C/C++

#### 2.2.1.2. Required packages in Python

#### 2.2.1.3. Installation

```bash
tar -zxvf $PACKAGES_FOLDER/pycurl-REL_7_19_5_3.tar.gz -C $HOME/tmp
cd $HOME/tmp/pycurl-REL_7_19_5_3

python setup.py build # gcc: src/docstrings.c: No such file or directory
```

### 2.2.2. libssh2

Several components are required in order to build **libssh**:
- A C compiler
- [CMake](http://www.cmake.org) >= 2.6.0.
- [openssl](http://www.openssl.org) >= 0.9.8 or [gcrypt](http://www.gnu.org/directory/Security/libgcrypt.html) >= 1.4
- optional: [libz](http://www.zlib.net) >= 1.2

Installation of libssh and PySecure is not viable ( it's best to minimize the required number of extra components on the system ).

#### 2.2.2.1. Required libraries in C/C++

```bash
tar -zxvf $PACKAGES_FOLDER/libssh2-1.6.0.tar.gz -C $HOME/tmp
cd $HOME/tmp/libssh2-1.6.0

./configure --enable-shared --prefix=$HOME
make && make check && make install
```

#### 2.2.2.2. Required packages in Python

N/A.

#### 2.2.2.3. Installation

```bash
tar -zxvf $PACKAGES_FOLDER/pylibssh2-1.0.1.tar.gz -C $HOME/tmp
cd $HOME/tmp/pylibssh2-1.0.1

export CPATH=$CPATH:$HOME/include
export LIBRARY_PATH=$LIBRARY_PATH:$HOME/lib
python setup.py build
python setup.py test
python setup.py install --user
unset CPATH
unset LIBRARY_PATH
```

```bash
py -m pip install --user --upgrade pylibssh2 # AttributeError: 'module' object has no attribute 'uname'
```

### 2.2.3. paramiko

#### 2.2.3.1. Required libraries in C/C++

```bash
tar -zxvf $PACKAGES_FOLDER/gmp-6.1.0.tar.gz -C $HOME/tmp
cd $HOME/tmp/gmp-6.1.0

./configure --enable-shared --prefix=$HOME
make && make check && make install
```

#### 2.2.3.2. Required packages in Python

```bash
tar -zxvf $PACKAGES_FOLDER/ecdsa-0.13.tar.gz -C $HOME/tmp
cd $HOME/tmp/ecdsa-0.13

python setup.py build
python setup.py test           # unknown option '-ecdsa-with-SHA1'
python setup.py install --user
```

```bash
tar -zxvf $PACKAGES_FOLDER/pycrypto-2.6.1.tar.gz -C $HOME/tmp
cd $HOME/tmp/pycrypto-2.6.1

export CPATH=$CPATH:$HOME/include
export LIBRARY_PATH=$LIBRARY_PATH:$HOME/lib
python setup.py build
python setup.py test           # You should rebuild using libgmp >= 5 to avoid timing attack vulnerability.
python setup.py install --user
unset CPATH
unset LIBRARY_PATH
```

**Note**: although PyCryptodome is a fork of PyCrypto it's not enough for Paramiko to successfully build.

#### 2.2.3.3. Installation

```bash
tar -zxvf $PACKAGES_FOLDER/paramiko-1.16.0.tar.gz -C $HOME/tmp
cd $HOME/tmp/paramiko-1.16.0

python setup.py build
python setup.py test           # ecdsa>=0.11, pycrypto!=2.4,>=2.1
python setup.py install --user
```

```bash
py -m pip install --user --upgrade paramiko
```

# 3. Results

Installation of **libcurl** or **libssh** is not trivial and did not complete successfully, neither on Windows or Linux. And although the installation of **libssh2** went well on Linux the same did not happen on Windows.

In fact, even with Visual C++ for Python and MinGW, the installation of **gmp** and **libssh2** did not succeed. MinGW managed to build **gmp** but not **libssh2** and Visual C++ for Python was not even attempted, due to lack of autoconf / automake tools.

For all these reasons the final veredict was to install and use paramiko, which requires ecdsa and PyCrypto that in turn requires gmp. The installation on Linux was manual while the installation on Windows only succeeded after using **pip** ( which requires online connection to deal with dependencies ).

# 4. WKE - Well Known Errors

## 4.1. Unable to find vcvarsall.bat

How to solve error: Unable to find vcvarsall.bat:

- [Compiling C extension modules on Windows](https://github.com/cython/cython/wiki/CythonExtensionsOnWindows)
- [error: Unable to find vcvarsall.bat](http://stackoverflow.com/questions/2817869/error-unable-to-find-vcvarsall-bat)
  - [Answer 18045219](http://stackoverflow.com/questions/2817869/error-unable-to-find-vcvarsall-bat/18045219#18045219)
  - [Answer 10501736](http://stackoverflow.com/questions/2817869/error-unable-to-find-vcvarsall-bat/10501736#10501736)
  - [Answer 15718810](http://stackoverflow.com/questions/2817869/error-unable-to-find-vcvarsall-bat/15718810#15718810)

## 4.2. Rebuild using libgmp >= 5 to avoid timing attack vulnerability

This happens, when testing PyCrypto, because the **gmp** library is not installed or because the include and the library folder cannot be found. To fix install **gmp** in user mode ( prefix=$HOME ) and set the following environment variables:

```bash
export CPATH=$CPATH:$HOME/include
export LIBRARY_PATH=$LIBRARY_PATH:$HOME/lib
```
