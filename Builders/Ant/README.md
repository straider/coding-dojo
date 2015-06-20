coding-dojo / Builders / Ant
============================

Dojo to learn and explore Apache Ant, the most common and used Java Builder Tool.

----

# 1. Introduction

> [Ant](http://en.wikipedia.org/wiki/Apache_Ant) is a software tool for automating software build processes. It originally came from the Apache Tomcat project in early 2000. It was a replacement for the unix **make** build tool, and was created due to a number of problems with the unix make. It is similar to Make but is implemented using the Java language, requires the Java platform, and is best suited to building Java projects. The most immediately noticeable difference between Ant and Make is that Ant uses XML to describe the build process and its dependencies, whereas Make uses Makefile format.

> Ant is an Apache project. It is open source software, and is released under the Apache License. Ant version 1.1 was officially released as a stand-alone product on July 19, 2000.

> Ant - _Another Neat Tool_ - was conceived by James Duncan Davidson while preparing Sun's reference JSP/Servlet engine, later Apache Tomcat, for release as open source. A proprietary version of make was used to build it on the Solaris Operating Environment, but in the open source world there was no way of controlling which platform was used to build Tomcat; so Ant was created as a simple platform-independent tool to build Tomcat from directives in an XML "build file".

## 1.1. Goals & Objectives

The objective of this dojo is to learn [Ant](http://ant.apache.org/) by practice, using small and simple exercises to understand the main features of this build tool.

The goals, of each milestone, are to produce well-formed _buildfiles_ that deliver the required artifacts.

Each milestone already has the necessary source files with Java classes and there's no need for dependency management.

**Note**: to assist Ant with dependency management one should use [Ivy](http://ant.apache.org/ivy/).

This is an introductory dojo and as such it's not meant to learn how to use macros or how to use 3rd party libraries in Ant, such as [ant-contrib](http://ant-contrib.sourceforge.net/).

## 1.2. Audience

This dojo is suitable to any programmer that wants to learn how to work with Ant in order to build Java projects.

## 1.3. History

- **1.9.5**: most recent version, released on Jun 03, 2015;
- **1.9.0**: released on Mar 07th, 2013, requires Java 1.5 or greater;
- **1.8.0**: released on Fev 08th, 2010, requires Java 1.4 or greater;
- **1.7.0**: released on Dez 19th, 2006, requires Java 1.3 or greater;
- **1.6.0**: released on Dez 18th, 2003, requires Java 1.2 or greater;
- **1.5**: released on Jul 10th, 2002;
- **1.1**: first oficial version, released on Jul 19th, 2000.

## 1.4. Limitations

- Ant build files, which are written in XML, can be complex and verbose:
  - The complex structure ( hierarchical, partly ordered, and pervasively cross-linked ) of Ant documents can be a barrier to learning;
  - The build files of large or complex projects can become unmanageably large;
  - Good design and modularization of build files can improve readability but not necessarily reduce size.
- Many of the older tasks—the core ones that are used every day - such as ```javac```, ```exec``` and ```java``` — use default values for options that are not consistent with more recent versions of the tasks;
- When expanding properties in a string or text element, undefined properties are not raised as an error, but left as an unexpanded reference;
- Ant has limited fault handling rules, and no persistence of state, so it cannot be used as a workflow tool for any workflow other than classic build and test processes;
- Lazy property evaluation is not supported.

**Note**: Other build tools, such as Maven, Gradle or BuildR, use more concise scripts at the expense of generality and flexibility.

----

# 2. Installation

> Ant requires a Java JDK or JRE to be installed, version 1.4 or higher.

To verify that the installation is successfully issue the following command:

```bash
ant -version
```

## 2.1. Binaries

- Download latest stable version from [official site](http://ant.apache.org/bindownload.cgi);
- Extract it to a folder, for example: /DevKits/Java/ant-1.9.5/;
- Fix PATH environment variable to include the bin/ sub-folder.

## 2.2. Sources

> To build Ant from source, you can either install the Ant source distribution or clone the ant repository from git. As of version 1.7.0 Ant has a hard dependency on JUnit. Make sure you have downloaded any [auxiliary jars](http://ant.apache.org/manual/install.html#librarydependencies) required to build tasks you are interested in. These should be added to the lib/optional/ directory of the source tree. You can also get most of the auxiliary jar files ( ie. the jar files that various optional Ant tasks depend on ) by running Ant on the fetch.xml build file.

**Note**: Note: The bootstrap process of Ant requires a greedy compiler like OpenJDK or Oracle's javac. It does not work with gcj or kjc.

```bash
build -Ddist.dir=/DevKits/Java/ant-1.9.5/ dist
build install
```

----

# 3. Milestones

Each milestone should improve the content of the buildfiles - **build.xml** and **build.properties** - upon the content of the previous one. This means that's wise to copy the buildfiles of the previous milestone into the current milestone and just do some minor editions to the content, instead of having to type everything all over again.

**Note** the folder structure, of each milestone, is:

- **sources/**: it contains the necessary source files with Java classes;
- **resources/**: it contains, when needed, the files with meta-code or files such as images, documents, etc.;
- **tests/**: it contains the optional source files with Java test classes, to validate the main source code;
- **reports/**: it contains, after execution of tests, the validation report files;
- **build/**: working folder, with the temporary *.class files that are the outcome of the build stage;
- **distribution/**: working folder, with the final files for distribution that are the result of the package stage.

## 3.1. Empty Project

- An empty build.xml, without build.properties, that Ant can handle;
- First line declares the build.xml to be an XML file, version 1.0, with UTF-8 encoding mode;
- It doesn't have any targets.

## 3.2. HelloWorld Project

- A build.xml, without build.properties, with one target: **greet**;
- It outputs the message "Hello, World!" to the console by using ```<echo>``` task.

**Note**: an Ant project is made up of targets that are in turn made up of tasks.

## 3.3. Java Project, build

- A build.xml with several targets, that should depend on variables set on build.properties:
  - **clean**: use ```delete``` task to delete working folder and temporary files ( build/, distribution/ and reports/**/* );
  - **init**: use ```mkdir``` task to create working folders ( build/, distribution/ and reports/ );
  - **build**: use ```javac``` task to build the .class files, one for each .java file that exists inside sources/ folder.<br />This target depends on init target.

**Note**: properties in Ant are **immutable**.

## 3.4. Java Project, library JAR

- A build.xml with targets from milestone 3 and a new target: **package**, that depends on the **build** target;
- This new target uses ```<jar>``` task to build the final JAR file, with a complete MANIFEST.INF:
  - Implementation-Title: Dojo Java Builders - Ant
  - Implementation-Version: 1.0.0
  - Implementation-Vendor: DoWeDo-IT
  - Implementation-Timestamp: current date and time;
  - Built-Date: current date and time;
  - Built-By: username.

**Note**: a target may depend on another target, which means that the deliverables of a target will depend on deliverables of a previous target.

## 3.5. Java Project, runnable JAR

- A build.xml with targets from milestone 3 and these new targets:
  - **package**: uses ```<jar>``` task to build a final JAR file. To make it  runnable the JAR manifest file must state which is the main class and what are the libraries that it depends on runtime - which are located in distribution/libraries/ folder:  
      - Implementation-Title: Dojo Java Builders - Ant
      - Implementation-Version: 1.0.0
      - Implementation-Vendor: DoWeDo-IT
      - Implementation-Timestamp: current date and time;
      - Built-Date: current date and time;
      - Built-By: username.
      - Main-Class: fully qualified class name, with its package name, of the main class ( the one that defines the ```main()``` method );
      - Class-Path: list of 3rd party libraries, separated by whitespace, that are required ar runtime.
  - **launch**: uses ```<java>``` task to execute the main class ( without or with arguments ) and it depends on target **package**.

**Note**: although it's possible to set different values for the execution arguments it's not possible to pass arguments to the main class through the command-line, because each argument on the command-line is seen by Ant as a target to execute.

## 3.6. Java Project, application WAR

- A build.xml with targets from milestone 3 and a new target: **package**, that depends on the **build** target;
- This new target uses ```<war>``` task to build the final WAR file, with a complete MANIFEST.INF:
  - Implementation-Title: Dojo Java Builders - Ant
  - Implementation-Version: 1.0.0
  - Implementation-Vendor: DoWeDo-IT
  - Implementation-Timestamp: current date and time;
  - Built-Date: current date and time;
  - Built-By: username.

**Note**: the ```<war>``` usually includes resources, such as web.xml, from resources/ folder, into the WEB-INF/ folder in the WAR file. More complex WAR files will also require other resources put into WEB-INF/lib/ or WEB-INF/classes/META-INF/ folders.

## 3.7. Java Project, application EAR

## 3.8. Java Project, with Sub-Projects
