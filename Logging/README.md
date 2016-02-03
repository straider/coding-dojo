coding-dojo / benchmarking / Logging
====================================

# 1. Introduction

Personal Coding Dojo for benchmarking several technologies while logging messages at different levels: OFF, INFO, DEBUG.

## 1.1. Goal and Objectives

- Learn how to replace normal output commands with logging messages;
- Learn how to configure the logging mechanism: to console, to file, at different levels;
- Measure performance between different implementations;
- Compare technology support for logging:
  - Either in standard library;
  - Or from best of breed 3rd party vendor ( FLOSS ).

## 1.2. Constraints

- Compilers and code should have no optimization features turned on;
- Must follow procedural paradigm, without using - as much as possible - classes or functional logic or specific language constructs.

# 2. Technologies

## 2.1. Compiled

### 2.1.1. Pascal

### 2.1.1.1. Libraries

- [LazLogger](http://wiki.lazarus.freepascal.org/LazLogger)
- [Log4Delphi](http://log4delphi.sourceforge.net/index.html)

### 2.1.1.2. Choices

### 2.1.2. C / C++

### 2.1.2.1. Libraries

C:

- [Log4c](http://log4c.sourceforge.net/)
- [zlog](http://hardysimpson.github.io/zlog/)
- [nglogc](https://code.google.com/archive/p/nglogc/)
- [lwl](http://home.gna.org/lwl/) - Log Writer Library

C++:

- [log4cxx](https://logging.apache.org/log4cxx/)
- [log4cpp](http://log4cpp.sourceforge.net/)
- [log4cplus](https://sourceforge.net/p/log4cplus/wiki/Home/)
- [Easylogging++](http://easylogging.muflihun.com/)
- [Pantheios](http://www.pantheios.org/)
- [Boost.Log](http://www.boost.org/doc/libs/1_60_0/libs/log/doc/html/index.html)
- [slog](https://github.com/kala13x/slog)
- [glog](https://github.com/google/glog)
- [zf_log](https://github.com/wonder-mice/zf_log)
- [spdlog](https://github.com/gabime/spdlog)

### 2.1.2.2. Choices

### 2.1.3. C#

### 2.1.3.1. Libraries

- [Logging Application Block](https://msdn.microsoft.com/en-us/library/aa480464.aspx)
- [log4net](http://logging.apache.org/log4net/index.html)
- [NLog](http://nlog-project.org/)
- [Common.Logging](http://netcommon.sourceforge.net/)
- [C# .NET Logger](https://sourceforge.net/projects/cslogger/)
- [Logger.NET](https://sourceforge.net/projects/logger-net/)
- [LogThis](https://sourceforge.net/projects/logthis/)

### 2.1.3.2. Choices

log4net:

- [Log4Net Tutorial pt 1: Getting Started](http://www.beefycode.com/post/Log4Net-Tutorial-pt-1-Getting-Started.aspx)
- [Log4Net Tutorial pt 2: Basic XML Configuration](http://www.beefycode.com/post/Log4Net-Tutorial-pt-2-Basic-XML-Configuration.aspx)
- [Adopting User Stories pt 3: Two Steps Forward](http://www.beefycode.com/post/Adopting-User-Stories-pt3-Two-Steps-Forward.aspx)
- [Using Log4Net in 4 Simple Steps](http://bigjimindc.blogspot.pt/2007/08/using-log4net-in-4-simple-steps.html)
- [Log4Net Tutorial in C# .net](https://sadi02.wordpress.com/2008/06/29/log4net-tutorial-in-c-net-how-can-i-show-log-in-a-file/)
- [A Brief Introduction to the log4net logging library, using C#](http://www.codeproject.com/Articles/8245/A-Brief-Introduction-to-the-log-net-logging-librar)
- [log4net Tutorial](http://www.codeproject.com/Articles/140911/log-net-Tutorial)
- [The Art of Logging](http://www.codeproject.com/Articles/42354/The-Art-of-Logging)
- [C# Tutorial for log4net](http://geekswithblogs.net/swisscoder/archive/2012/05/13/c-tutorial-for-log4net-again.aspx)
- [log4net tutorial– Great library for logging](https://csharp.today/log4net-tutorial-great-library-for-logging/)

### 2.1.4. Java

### 2.1.4.1. Libraries

- [JUL](https://docs.oracle.com/javase/7/docs/api/java/util/logging/package-summary.html) - java.util.logging
- [Log4j 1](http://logging.apache.org/log4j/1.2/)
- [Log4j 2](http://logging.apache.org/log4j/2.x/)
- [Logback](http://logback.qos.ch/)
- [SLF4J](http://www.slf4j.org/) - Simple Logging Facade for Java
- [Commons Logging](http://commons.apache.org/proper/commons-logging/)
- [tinylog](http://www.tinylog.org/)
- [Simple-log](https://java.net/projects/simple-log)

### 2.1.4.2. Choices

### 2.1.5. Go

### 2.1.5.1. Libraries

- [log](https://golang.org/pkg/log/)
- [log4go](https://github.com/alecthomas/log4go)
- [google-go-log4go](https://github.com/dmuth/google-go-log4go)
- [log15](https://github.com/inconshreveable/log15)
- [glog](https://github.com/golang/glog)
- [seelog](https://github.com/cihub/seelog)
- [logrus](https://github.com/Sirupsen/logrus)

### 2.1.5.2. Choices

- [Think Differently About What to Log in Go: Best Practices Examined](https://www.loggly.com/blog/think-differently-about-what-to-log-in-go-best-practices-examined/)

## 2.2. Interpreted

### 2.2.1. Perl

### 2.2.1.1. Libraries

- [Log::Message](http://perldoc.perl.org/Log/Message.html)
- [Log::Log4perl](https://metacpan.org/release/Log-Log4perl)
- [Log::Dispatch](https://metacpan.org/release/Log-Dispatch)
- [Log::Fast](https://metacpan.org/release/Log-Fast)
- [Log::Any](https://metacpan.org/release/Log-Any)

### 2.2.1.2. Choices

Log::Log4perl:

- [Log::Log4perl](http://mschilli.github.io/log4perl/) is a Perl port of the widely popular log4j logging package;
- [log4perl](https://github.com/mschilli/log4perl)
- [Retire your debugger, log smartly with Log::Log4perl!](http://www.perl.com/pub/2002/09/11/log4perl.html)
- [8 Useful Log::Log4perl Recipes](http://ddiguru.com/blog/126-eight-loglog4perl-recipes)

### 2.2.2. Python / Jython

### 2.2.2.1. Libraries

- [logging API](https://docs.python.org/2/library/logging.html)
- [Logbook](https://pypi.python.org/pypi/Logbook)

### 2.2.2.2. Choices

Logging API:

- [A Logging System for Python](https://www.red-dove.com/python_logging.html)
- [Good logging practice in Python](http://victorlin.me/posts/2012/08/26/good-logging-practice-in-python)
- [Use of logging package from within a library](http://pythonsweetness.tumblr.com/post/67394619015/use-of-logging-package-from-within-a-library)
- [Python Logging Best Practices](http://pieces.openpolitics.com/2012/04/python-logging-best-practices/)

### 2.2.3. Ruby / JRuby

### 2.2.3.1. Libraries

- [logger](http://ruby-doc.org/stdlib-2.3.0/libdoc/logger/rdoc/Logger.html)
- [log4r](https://rubygems.org/gems/log4r)
- [Logging](https://rubygems.org/gems/logging/versions/2.0.0) is a flexible logging library for use in Ruby programs based on the design of Java's log4j library;
- [Yell](https://rubygems.org/gems/yell) - Your Extensible Logging Library;
- [Hatchet](https://rubygems.org/gems/hatchet) is a logging framework written from the ground up in Ruby. It has been inspired by the likes of log4j and slf4j but is not a port of either of them.

### 2.2.3.2. Choices

Logger:

- [Using the Ruby Logger](http://hawkins.io/2013/08/using-the-ruby-logger/)
- [All Rubyists Love Logging](http://www.sitepoint.com/rubyists-love-logging/)

log4r:

- [Log4r](http://log4r.rubyforge.org/)
- [log4r](https://github.com/colbygk/log4r)
- [Log4r - Usage and Examples](http://angrez.blogspot.pt/2006/12/log4r-usage-and-examples.html)

### 2.2.4. Groovy

### 2.2.4.1. Libraries

### 2.2.4.2. Choices

### 2.2.5. Shell

### 2.2.5.1. Libraries

- [log4sh](https://sourceforge.net/projects/log4sh/) is an advanced logging framework for shell scripts;
- [shell-log](https://github.com/CraigJPerry/shell-log) is a tiny cross platform & cross shell, log4j alike, logging library;
- [ksh-logger](https://github.com/jmorenoamor/ksh-logger): Simple logger library for shell scripts;
- [task-logger.sh](https://github.com/posva/task-logger.sh) is a shell library to log tasks with nice output. Supports zsh and bash;
- [log4bash](http://www.gossiplabs.org/log4bash.html) is a Log4J style logging utility for bash scripts;
- [Bashinator ](http://www.bashinator.org/) is a framework for bash shell scripts.

### 2.2.5.2. Choices

# 3. Results
