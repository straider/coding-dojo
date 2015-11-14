coding-dojo / benchmarking / SFTP
=================================

# 1. Introduction

Personal Coding Dojo for benchmarking of several technologies while transfering files to and from a [SSH](https://en.wikipedia.org/wiki/Secure_Shell) server.

## 1.1. Goal and Objectives

- Learn how to code SSH clients and SSH servers;
- Measure performance between different implementations;
- Compare technology support for SSH file transfer operations: put / get:
  - Either in standard library;
  - Or from best of breed 3rd party vendor ( FLOSS ).

## 1.2. Constraints

- Compilers and code should have no optimization features turned on;
- Must follow procedural paradigm, without using - as much as possible - classes or functional logic or specific language constructs.

# 2. Technologies

## 2.1. Compiled

### 2.1.1. Pascal

### 2.1.2. C

Libraries:

- [libssh](https://www.libssh.org/) is a mulitplatform C library implementing the SSHv2 and SSHv1 protocol on client and server side;
- [libssh2](http://www.libssh2.org/) is a client-side C library implementing the SSH2 protocol;
- [libcurl](http://curl.haxx.se/libcurl/) is a free and easy-to-use client-side URL transfer library, supporting DICT, FILE, FTP, FTPS, Gopher, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, Telnet and TFTP.

Choices:

- libssh
- libssh2
- libcurl

### 2.1.3. C#

Libraries:

- [WinSCP .NET Assembly and COM Library](http://winscp.net/eng/docs/library) is a .NET wrapper around WinSCP’s scripting interface;
- [SharpSSH](www.tamirgal.com/blog/page/SharpSSH.aspx) is a pure .NET implementation of the SSH2 client protocol suite - and is a port of JCraft's java Jsch;
- [SharpSSH](https://bitbucket.org/mattgwagner/sharpssh)
- [Granados](http://granados.sourceforge.net/) is an SSH client library for .NET;
- [DotNetSSH](https://sourceforge.net/projects/dotnetssh/) is a pure .NET implementation of the SSH2 client protocol suite. DotNetSSH development is alive and active. DotNetSSH is a fork of Tamir's excellent SharpSSH;
- [SSH.NET Library](https://sshnet.codeplex.com/) is a complete rewrite using .NET 4.0, without any third party dependencies, inspired by Sharp.SSH library and using parallelism to achieve the best performance possible;

Choices:

- DotNetSSH
- SSH.NET Library

### 2.1.4. Java

Libraries:

- [JSch](http://www.jcraft.com/jsch/) is a pure Java implementation of SSH2;
- [Ganymed SSH-2 for Java](http://www.ganymed.ethz.ch/ssh2/) is a library which implements the SSH-2 protocol in pure Java;
- [jaramiko](http://www.lag.net/jaramiko/) is a port of paramiko for java: a pure-Java implementation of the SSH version 2 protocol;
- [sshj](https://github.com/hierynomus/sshj): SSHv2 library for Java;
- [SSHTools](http://sshtools.sourceforge.net/) is an implementation of the SSH protocol in Java.

Choices:

- JSch
- jaramiko

### 2.1.5. Go

Libraries:

- [golang/crypto](https://github.com/golang/crypto/): Go supplementary cryptography libraries
- [pkg/sftp](https://github.com/pkg/sftp): SFTP support for the go.crypto/ssh package.

Choices:

- crypto/ssh

## 2.2. Interpreted

### 2.2.1. Perl

Libraries:

- [libnet-3.07](http://search.cpan.org/~shay/libnet-3.07/) is a class implementing a simple FTP client in Perl as described in RFC959. And with IO::Socket::SSL installed it provides support for implicit FTPS and explicit FTPS as defined in RFC4217;
- [Net-SSH-Perl-1.42](http://search.cpan.org/~schwigon/Net-SSH-Perl-1.42/)  is an all-Perl module implementing an SSH (Secure Shell) client. It is compatible with both the SSH-1 and SSH-2 protocols:
  - [Net-SSH-W32Perl-0.05](http://search.cpan.org/~scotts/Net-SSH-W32Perl-0.05/)
  - [Net-SFTP-0.10](http://search.cpan.org/~dbrobins/Net-SFTP-0.10/) is a pure-Perl implementation of the Secure File Transfer Protocol (SFTP) - file transfer built on top of the SSH2 protocol.
- [Net-SSH2-0.56](http://search.cpan.org/~salva/Net-SSH2-0.56/) is a module wrapping libssh2, an SSH version 2 client library written in C;
- [Net-SFTP-Foreign-1.79](http://search.cpan.org/~salva/Net-SFTP-Foreign-1.79/) is a Perl client for the SFTP version 3 and it does not require a bunch of additional modules and external libraries to work, just the OpenBSD SSH client.
- [Net-SFTP-SftpServer-1.1.0](http://search.cpan.org/~simm/Net-SFTP-SftpServer-1.1.0/) is a Perl implementation of the SFTP subsystem with user access controls;
- [Net-SFTP-Server-0.03](http://search.cpan.org/~salva/Net-SFTP-Server-0.03/) provides a framework for implementing SFTP servers.

Choices:

- Net::SFTP
- Net::SFTP::Foreign
- Net::SSH2

### 2.2.2. Python / Jython

- [ftplib](https://docs.python.org/2/library/ftplib.html) is part of the Standard Library and implements the client side of the FTP protocol;
- [Python FTP server library](https://github.com/giampaolo/pyftpdlib) provides a high-level portable interface to easily write very efficient, scalable and asynchronous FTP servers with Python. It is the most complete RFC-959 FTP server implementation available for Python programming language;
- [pysftp](https://pypi.python.org/pypi/pysftp) is a simple interface to SFTP, based on zeth’s ssh.py;
- [paramiko](https://github.com/paramiko/paramiko) it's a module for python 2.6+ that implements the SSH2 protocol for secure (encrypted and authenticated) connections;
  - [sshstdlib](https://github.com/stestagg/sshstdlib) is a standard library emulation layer over SSH that uses paramiko;
- [Exscript](https://github.com/knipknap/exscript) is a Python module making Telnet and SSH easy, on top of paramiko;
  - [spur.py](https://github.com/mwilliamson/spur.py) runs commands and manipulate files locally or over SSH using the same interface;
  - [ssh](https://github.com/bitprophet/ssh/) started life as a fork of Paramiko but has now been fully merged back upstream.
- [PySecure](https://github.com/dsoprea/PySecure) is a complete Python SSH/SFTP library based on libssh;
- [Python SFTP Client](https://github.com/cis-yogesh/Python_sftp_client)
- [PySSH](http://pyssh.sourceforge.net/) is a Python library for programmatically controlling ssh and scp.
- [AsyncSSH](https://pypi.python.org/pypi/asyncssh) is a Python package which provides an asynchronous client and server implementation of the SSHv2 protocol on top of the Python 3.4+ asyncio framework;
- [pysftpserver](https://github.com/unbit/pysftpserver) is an OpenSSH SFTP wrapper in Python;
- [sftpserver](https://pypi.python.org/pypi/sftpserver) is a simple single-threaded SFTP server based on Paramiko’s SFTPServer;
- [PycURL](http://pycurl.sourceforge.net/) is a Python interface to libcurl.

Choices:

- pysftp
- paramiko
- PySecure

### 2.2.3. Ruby / JRuby

- [Net::FTP](http://ruby-doc.org/stdlib-2.2.3/libdoc/net/ftp/rdoc/) is part of the Standard Library and implements the File Transfer Protocol;
- [Net::SSH](https://github.com/net-ssh/net-ssh) is a pure-Ruby implementation of the SSH2 client protocol;
  - [Net::SFTP](https://github.com/net-ssh/net-sftp) is a pure-Ruby implementation of the SFTP protocol (specifically, versions 1 through 6 of the SFTP protocol);
  - [Net::SSH::Simple](https://github.com/busyloop/net-ssh-simple) is a simple wrapper around Net::SSH and Net::SCP;
  - [SimpleSsh](https://github.com/szuecs/simple_ssh) is a simple wrapper around the net-ssh gem;
  - [FunSftp](https://github.com/georgediaz88/fun_sftp) provides a nice and easy to use wrapper for the Net::SFTP library.
- [SFTP Downloader](https://github.com/olistik/sftp_downloader) performs asynchronous SFTP downloads, ensuring that notifications of succesful downloads respect a sequential order;
- [SFTPServer](https://github.com/corgibytes/sftp_server) is a simple SFTP server for testing clients that uses libssh via FFI to create an SFTP server.

Choices:

- Net::SFTP

### 2.2.4. Groovy

Libraries:

- [JSch](http://www.jcraft.com/jsch/) is a pure Java implementation of SSH2.

Choices:

- JSch

# 3. Results
