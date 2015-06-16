coding-dojo / Builders / Gradle
===============================

Dojo to learn and explore Gradle, one of the Java Builder Tools.

----

# 1. Introduction

> [Gradle](http://en.wikipedia.org/wiki/Gradle) is a project automation tool that builds upon the concepts of Apache Ant and Apache Maven and introduces a Groovy-based domain-specific language (DSL) instead of the more traditional XML form of declaring the project configuration.

> Gradle is a multi-platform tool. It runs on every operating system on which Java can be installed.

> Gradle was designed for multi-project builds which can grow to be quite large, and supports incremental builds by intelligently determining which parts of the build tree are up-to-date, so that any task dependent upon those parts will not need to be re-executed.

Neal Ford, Director, Software Architect, and Meme Wrangler at ThoughtWorks, has a post with the title [Why Everyone (Eventually) Hates (or Leaves) Maven](http://nealford.com/memeagora/2013/01/22/why_everyone_eventually_hates_maven.html) where he points out two sides of build tools: contextual, such as Maven, and composable, such as Rake or Gradle.

## 1.1. Goals & Objectives

The objective of this dojo is to learn [Gradle](https://gradle.org/) by practice, using small and simple exercises to understand the main features of this build tool.

The goals, of each milestone, are to produce well-formed _buildfiles_ that deliver the required artifacts.

Each milestone already has the necessary source files with Java classes and there's no need for dependency management.

## 1.2. Audience

This dojo is suitable to any programmer that wants to learn how to work with Ant in order to build Java projects.

## 1.3. History

- 2.4 was released on May 05th, 2015;
- 2.0 was released on July 01st, 2014;
- 1.0 was released on June 12th, 2012.

## 1.4. Limitations

## 1.5. Features

> Gradle provides:
- A very flexible general purpose build tool like Ant;
- Switchable, build-by-convention frameworks a la Maven.<br />_But we never lock you in_!
- Very powerful support for multi-project builds;
- Very powerful dependency management ( based on Apache Ivy );
- Full support for your existing Maven or Ivy repository infrastructure;
- Support for transitive dependency management without the need for remote repositories or pom.xml and ivy.xml files;
- Ant tasks and builds as first class citizens;
- Groovy build scripts;
- A rich domain model for describing your build;
- A GUI to visual control and execution of tasks;
- A wrapper for distribution of projects to environments without Gradle installed.

----

# 2. Installation

> Gradle requires a Java JDK or JRE to be installed, version 6 or higher. Gradle ships with its own Groovy library, therefore Groovy does not need to be installed. Any existing Groovy installation is ignored by Gradle.

## 2.1. Binaries

- Download latest stable version from [official site](https://gradle.org/);
- Extract it to a folder, for example: /DevKits/Java/gradle-2.4/;
- Fix PATH environment variable to include the bin/ sub-folder.

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

----

# 3. Milestones

Each milestone should improve the content of the buildfiles - **build.xml** e **build.properties** - upon the content of the previous one. This means that's wise to copy the buildfiles of the previous milestone into the current milestone and just do some minor editions to the content, instead of having to type everything all over again.

**Note** the folder structure, of each milestone, is:

- **sources/**: it contains the necessary source files with Java classes;
- **resources/**: it contains, when needed, the files with meta-code or files such as images, documents, etc.;
- **tests/**: it contains the optional source files with Java test classes, to validate the main source code;
- **reports/**: it contains, after execution of tests, the validation report files;
- **build/**: working folder, with the temporary *.class files that are the outcome of the build stage;
- **distribution/**: working folder, with the final files for distribution that are the result of the package stage.

**Note**: Gradle key concepts are **projects** and **tasks**:
- Every Gradle build is made up of one or more projects;
- Each project is made up of one or more tasks.<br />A task represents some atomic piece of work which a build performs. 

Gradle, by convention, assumes specific folder paths for its sourceSets:
- sources should be under src/main/java/;
- resources should be under src/main/resources/;
- build will contain working files and folders, under build/;
- distribution will be at build/libs/.

These default folder paths must be overridden to match this dojo folder structure ( and it's a good test on how hard it can be to not follow a convention ).

## 3.1. Empty Project

- An empty build.gradle, without gradle.properties or settings.gradle, that Gradle can handle;
- It doesn't have any tasks, besides the default tasks.

By default, Gradle without any plugins offers the following tasks:

- **init**: initializes a new Gradle build;
- **wrapper**: generates Gradle wrapper files;
- **tasks**: displays the tasks runnable from root project;
- **projects**: displays the sub-projects of root project;
- **components**: displays the components produced by root project.

**Note**: this buildfile can actually be empty ( 0 bytes in size ) and Gradle copes with that, unlike Ant or Maven which require an empty XML content.

## 3.2. HelloWorld Project

- build.gradle, without gradle.properties or settings.gradle, with one task: **greet**;
- It outputs the message "Hello, World!" to the console by using ```println``` command.

**Note**: a task can have pre and post code blocks. These are executed before and after the task code block executes, respectively.

## 3.3. Java Project, build

- build.gradle with several tasks, that should depend on variables set on gradle.properties:
  - **clean**: by default the folder build/ is removed by task clean but since we're using a custom distribution/ folder it's necessary to override clean task configuration to also remove distribution/ folder and resources/** files;
  - ~~**initialize**: use ```mkdirs()``` method from Java **File** class to create working folders ( build/, distribution/ and reports/ )~~;
  - **compile**: depends on ```classes``` task and must override ```compileJava``` task to build the .class files, one for each .java file encoded in UTF-8 mode that exists inside sources/ folder ( among other specific options for javac ).

**Note**: include plugins base and java. These plugins will include new tasks:

- base:
  - **assemble**: assembles the outputs of this project;
  - **build**: assembles and tests this project;
  - **clean**: deletes the build directory;
  - **check**: runs all checks.
- java
  - **javadoc**: generates Javadoc API documentation for the main source code;
  - **jar**: assembles a jar archive containing the main classes;
  - **test**: runs the unit tests;

## 3.4. Java Project, library JAR

- build.gradle based on milestone 3 with a new task - **distribute** - that inherits from ```Copy``` task;
- This new task depends on the task **compile**;
- This new task also depends on ```jar``` task ( already provided by plugin **java** ), which must be _overridden_ to build the final JAR file, with a complete MANIFEST.INF:
  - Implementation-Title: Dojo Java Builders - Gradle
  - Implementation-Version: 1.0.0
  - Implementation-Vendor: DoWeDo-IT
  - Implementation-Timestamp: current date and time;
  - Built-Date: current date and time;
  - Built-By: username.

**Note**: a task may depend on another task, which means that the deliverables of a task will depend on deliverables of a previous task.

## 3.5. Java Project, runnable JAR

- build.gradle based on milestone 3 with new tasks:
  - **distribute**: similar to task of same name in milestone 4.<br />To make it runnable the JAR manifest file must state which is the main class and what are the libraries that it depends on runtime - which are located in distribution/libraries/ folder:  
      - Implementation-Title: Dojo Java Builders - Gradle
      - Implementation-Version: 1.0.0
      - Implementation-Vendor: DoWeDo-IT
      - Implementation-Timestamp: current date and time;
      - Built-Date: current date and time;
      - Built-By: username.
      - Main-Class: fully qualified class name, with its package name, of the main class ( the one that defines the ```main()``` method );
      - Class-Path: list of 3rd party libraries, separated by whitespace, that are required ar runtime.
  - **launch**: inherits from ```JavaExec``` task to execute the main class ( without or with arguments ) and it depends on target **distribute**.

**Note**: there are other plugins that can be included to help out in executing a JAR file. These plugins, distribution and application, will include new tasks:

- distribution:
  - **assembleMainDist**: assembles the main distributions, by bundling the project in a tarball and in a ZIP file in the build/distributions/ folder;
  - **installDist**: installs the project as a distribution as-is, with OS specific scripts to launch the application, at the build/install/ folder.
- application
  - **installApp**: installs the project as a JVM application along with libs and OS specific scripts, at the build/install/ folder;
  - **run**: runs this project as a JVM application.

**Note**: although it's possible to set different values for the execution arguments it's not possible to pass arguments to the main class through the command-line, because each argument on the command-line is seen by Ant as a target to execute.

> The installApp task has been deprecated and is scheduled to be removed in Gradle 3.0. Please use the installDist task instead.

## 3.6. Java Project, application WAR

- build.gradle based on milestone 3 with a new task - **distribute** - that inherits from ```Copy```;
- This new task depends on the task **compile**.
- This new task also depends on ```war``` task to build the final WAR file, with a complete MANIFEST.INF:
  - Implementation-Title: Dojo Java Builders - Gradle
  - Implementation-Version: 1.0.0
  - Implementation-Vendor: DoWeDo-IT
  - Implementation-Timestamp: current date and time;
  - Built-Date: current date and time;
  - Built-By: username.

**Note**: include plugin war that will include a new task: **war**. This new task generates a war archive with all the compiled classes, the web-app content and the libraries.

**Note**: the ```war``` usually includes resources, such as web.xml, from resources/ folder, into the WEB-INF/ folder in the WAR file. More complex WAR files will also require other resources put into WEB-INF/lib/ or WEB-INF/classes/META-INF/ folders.

## 3.7. Java Project, application EAR

## 3.8. Java Project, with Sub-Projects

- declare sub-projects in settings.gradle
- declare common configuration for all sub-projects
- how to declare common configuration for a subset of sub-projects?
