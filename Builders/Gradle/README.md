coding-dojo / Builders / Gradle
===============================

Dojo to learn and explore Gradle, one of the Java Builder Tools.

# 1. Introduction

> [Gradle](http://en.wikipedia.org/wiki/Gradle) is a project automation tool that builds upon the concepts of Apache Ant and Apache Maven and introduces a Groovy-based domain-specific language (DSL) instead of the more traditional XML form of declaring the project configuration.

> Gradle is a multi-platform tool. It runs on every operating system on which Java can be installed.

Neal Ford, Director, Software Architect, and Meme Wrangler at ThoughtWorks, has a post with the title [Why Everyone (Eventually) Hates (or Leaves) Maven](http://nealford.com/memeagora/2013/01/22/why_everyone_eventually_hates_maven.html) where he points out two sides of build tools: contextual, such as Maven, and composable, such as Rake or Gradle.

## 1.1. Goals & Objectives

The objective of this dojo is to learn [Gradle](https://gradle.org/) by practice, using small and simple exercises to understand the main features of this build tool.

The goals, of each milestone, are to produce well-formed _buildfiles_ that deliver the required artifacts.

Each milestone already has the necessary source files with Java classes and there's no need for dependency management.

## 1.2. Audience

This dojo is suitable to any programmer that wants to learn how to work with Ant in order to build Java projects.

## 1.3. History

## 1.4. Limitations

# 2. Installation

> Gradle requires a Java JDK or JRE to be installed, version 6 or higher. Gradle ships with its own Groovy library, therefore Groovy does not need to be installed. Any existing Groovy installation is ignored by Gradle.

## 2.1. Binaries

- Download latest stable version from [official site](https://gradle.org/);
- Fix PATH environment variable to include the bin/ sub-folder after extracting from the file.

## 2.2. Sources

> Naturally, Gradle builds itself with Gradle. Gradle provides an innovative wrapper that allows you to work with a Gradle build without having to manually install Gradle. The wrapper is a batch script on Windows and a shell script on other operating systems.

> To build the entire Gradle project, you should run the following in the root of the checkout:

```bash
./gradlew build
```

> To create an install from the source tree you can run either of the following:

```bash
./gradlew install -Pgradle_installPath=/usr/local/gradle-source-build
/usr/local/gradle-source-build/bin/gradle «some task»
```

```bash
./gradlew installAll -Pgradle_installPath=/usr/local/gradle-source-build
```

## 2.3. GVM

It's possible to install Gradle, in Linux / MacOS or Windows, with **Groovy enVironment Manager**: [gvm](https://github.com/gvmtool/gvm-cli) or [posh-gvm](https://github.com/flofreud/posh-gvm).

# 3. Milestones

Each milestone should improve the content of the buildfiles - **build.xml** e **build.properties** - upon the content of the previous one. This means that's wise to copy the buildfiles of the previous milestone into the current milestone and just do some minor editions to the content, instead of having to type everything all over again.

**Note** the folder structure, of each milestone, is:

- **sources/**: it contains the necessary source files with Java classes;
- **resources/**: it contains, when needed, the files with meta-code or files such as images, documents, etc.;
- **tests/**: it contains the optional source files with Java test classes, to validate the main source code;
- **reports/**: it contains, after execution of tests, the validation report files;
- **build/**: working folder, with the temporary *.class files that are the outcome of the build stage;
- **distribution/**: working folder, with the final files for distribution that are the result of the package stage.

## 3.1. Empty Project

- An empty build.gradle, without gradle.properties or settings.gradle, that Gradle can handle;
- It doesn't have any tasks, besides the default tasks.

By default, Gradle without any plugins offers the following tasks:

FIXME

## 3.2. HelloWorld Project

- build.gradle, without gradle.properties or settings.gradle, with one task: **greet**;
- It outputs the message "Hello, World!" to the console by using ```println``` command.

**Note**: an Gradle project is made up ... FIXME subprojects, tasks, ... What's the lifecycle, dependencies management, ...?

## 3.3. Java Project, build

- build.gradle with several tasks, that should depend on variables set on gradle.properties:
  - **clean**: use ```delete``` command to delete working folder and temporary files ( build/, distribution/ and reports/**/* );
  - **init**: use ```mkdir``` command to create working folders ( build/, distribution/ and reports/ );
  - **build**: use ```compileJava``` task to build the .class files, one for each .java file that exists inside sources/ folder.

**Note**: include plugins base and java. These plugins will include new tasks:

- base:
  - FIXME
- java
  - FIMXE

## 3.4. Java Project, library JAR

- build.gradle with a new task: **package-jar**;
- This new task uses ```jar``` task to build the final JAR file, with a complete MANIFEST.INF:
  - Implementation-Title: Dojo Builders - Ant
  - Implementation-Version: 1.0.0
  - Implementation-Vendor: DoWeDo-IT
  - Implementation-Timestamp: current date and time;
  - Built-Date: current date and time;
  - Built-By: username.
- This new task depends on the task **build**.

**Note**: a task may depend on another task, which means that the deliverables of a task will depend on deliverables of a previous target.

## 3.5. Java Project, runnable JAR

- build.gradle with new tasks:
  - **package-run**: uses ```jar``` task to build a final JAR file. To make it  runnable the JAR manifest file must state which is the main class and what are the libraries that it depends on runtime - which are located in distribution/libraries/ folder:  
      - Implementation-Title: Dojo Builders - Ant
      - Implementation-Version: 1.0.0
      - Implementation-Vendor: DoWeDo-IT
      - Implementation-Timestamp: current date and time;
      - Built-Date: current date and time;
      - Built-By: username.
      - Main-Class: fully qualified class name, with its package name, of the main class ( the one that defines the ```main()``` method );
      - Class-Path: list of 3rd party libraries, separated by whitespace, that are required ar runtime.
  - **launch**: uses ```run``` task to execute the main class ( without or with arguments ) and it depends on target **package-run**.

**Note**: include plugins distribution / application. These plugins will include new tasks:

- distribution:
  - FIXME
- application
  - FIMXE

**Note**: although it's possible to set different values for the execution arguments it's not possible to pass arguments to the main class through the command-line, because each argument on the command-line is seen by Ant as a target to execute.

## 3.6. Java Project, application WAR

- build.gradle with a new task: **package-war**;
- This new task uses ```war``` task to build the final WAR file, with a complete MANIFEST.INF:
  - Implementation-Title: Dojo Builders - Ant
  - Implementation-Version: 1.0.0
  - Implementation-Vendor: DoWeDo-IT
  - Implementation-Timestamp: current date and time;
  - Built-Date: current date and time;
  - Built-By: username.
- This new task depends on the task **build**.

**Note**: include plugin war that will include new tasks:

- FIXME

**Note**: the ```war``` usually includes resources, such as web.xml, from resources/ folder, into the WEB-INF/ folder in the WAR file. More complex WAR files will also require other resources put into WEB-INF/lib/ or WEB-INF/classes/META-INF/ folders.

## 3.7. Java Project, application EAR

## 3.8. Java Project, with Sub-Projects

- declare sub-projects in settings.gradle
- declare common configuration for all sub-projects
- how to declare common configuration for a subset of sub-projects?
