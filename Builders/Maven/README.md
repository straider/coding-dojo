coding-dojo / Builders / Maven
==============================

Dojo to learn and explore Maven, one of the Java Builder Tools.

----

# 1. Introduction

> [Maven](http://en.wikipedia.org/wiki/Maven) is a build automation tool used primarily for Java projects. The word maven means _accumulator of knowledge_ in Yiddish. Maven addresses two aspects of building software: First, it describes how software is built, and second, it describes its dependencies. Contrary to preceding tools like Apache Ant, it uses conventions for the build procedure, and only exceptions need to be written down.

> An XML file describes the software project being built, its dependencies on other external modules and components, the build order, directories, and required plug-ins. It comes with pre-defined targets for performing certain well-defined tasks such as compilation of code and its packaging.

Maven key concepts are:
- The pom.xml file - [Project Object Model](http://maven.apache.org/guides/introduction/introduction-to-the-pom.html) - is the core of a project's configuration in Maven. It is a single configuration file that contains the majority of information required to build a project in just the way you want. The POM is huge and can be daunting in its complexity, but it is not necessary to understand all of the intricacies just yet to use it effectively;
- **Plugins**;
- **Lifecycles**: are a list of [named phases](http://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html) that can be used to give order to goal execution. The specific goal executed per phase is dependent upon the packaging type of the project. Maven defines 3 [lifecycles](http://maven.apache.org/ref/3.3.3//maven-core/lifecycles.html): **default**, **clean** and **site**. Goals provided by plugins can be associated with different phases of the lifecycle.

> Maven is a multi-platform tool. It runs on every operating system on which Java can be installed.

> Using Maven, the user provides only configuration for the project, while the configurable plug-ins do the actual work of compiling the project, cleaning target directories, running unit tests, generating API documentation and so on. In general, users should not have to write plugins themselves. Contrast this with Ant and make, in which one writes imperative procedures for doing the aforementioned tasks.

Neal Ford, Director, Software Architect, and Meme Wrangler at ThoughtWorks, has a post with the title [Why Everyone (Eventually) Hates (or Leaves) Maven](http://nealford.com/memeagora/2013/01/22/why_everyone_eventually_hates_maven.html) where he points out two sides of build tools: contextual, such as Maven, and composable, such as Rake or Gradle.

## 1.1. Goals & Objectives

The objective of this dojo is to learn [Maven](https://maven.apache.org/) by practice, using small and simple exercises to understand the main features of this build tool.

The goals, of each milestone, are to produce well-formed _buildfiles_ that deliver the required artifacts.

Each milestone already has the necessary source files with Java classes and there's no need for dependency management.

## 1.2. Audience

This dojo is suitable to any programmer that wants to learn how to work with Maven in order to build Java projects.

## 1.3. History

- 3.0 was released on October 2010;
- 2.0 was released on October 2005;
- 1.0 was released on July 2004.

> Maven, created by Takari's Jason van Zyl, began as a subproject of Apache Turbine in 2002. In 2003, it was voted on and accepted as a top level Apache Software Foundation project. 

The official site keeps a page about the [History of Maven by Jason van Zyl](http://maven.apache.org/background/history-of-maven.html).

## 1.4. Limitations

## 1.5. Features

> The following are the key features of Maven in a nutshell:
- Simple project setup that follows best practices;
- Get a new project or module started in seconds;
- Consistent usage across all projects means no ramp up time for new developers coming onto a project;
- Superior dependency management including automatic updating, with transitive dependencies ( dependency closures );
- Able to easily work with multiple projects at the same time;
- A large and growing repository of libraries and metadata to use out of the box;
- Extensible, with the ability to easily write plugins in Java or scripting languages;
- Instant access to new features with little or no extra configuration;
- Ant tasks for dependency management and deployment outside of Maven;
- Model based builds;
- Coherent site of project information;
- Release management and distribution publication;
- Dependency management: Maven encourages the use of a central repository of JARs and other dependencies. Maven comes with a mechanism that your project's clients can use to download any JARs required for building your project from a central JAR repository much like Perl's CPAN. This allows users of Maven to reuse JARs across projects and encourages communication between projects to ensure that backward compatibility issues are dealt with.

----

# 2. Installation

> Maven requires a Java JDK or JRE to be installed, version 7 or higher.

To verify that the installation is successfully issue the following command:

```bash
mvn -version
```

## 2.1. Binaries

- Download latest stable version from [official site](https://maven.apache.org/download.cgi);
- Extract it to a folder, for example: /DevKits/Java/maven-3.3.3/;
- Fix PATH environment variable to include the bin/ sub-folder.

## 2.2. Sources

> If you want to bootstrap Maven, you'll need: JDK 1.7+ and Ant 1.8 or later. Run Ant, specifying a location into which the completed Maven distro should be installed:

```bash
ant -Dmaven.home="[MAVEN_HOME]"
```

> Once the build completes, you should have a new Maven distro ready to roll in that directory!

----

# 3. Milestones

Each milestone should improve the content of the buildfiles - **pom.xml** - upon the content of the previous one. This means that's wise to copy the buildfiles of the previous milestone into the current milestone and just do some minor editions to the content, instead of having to type everything all over again.

**Note** the folder structure, of each milestone, is:

- **sources/**: it contains the necessary source files with Java classes;
- **resources/**: it contains, when needed, the files with meta-code or files such as images, documents, etc.;
- **tests/**: it contains the optional source files with Java test classes, to validate the main source code;
- **reports/**: it contains, after execution of tests, the validation report files;
- **build/**: working folder, with the temporary *.class files that are the outcome of the build stage;
- **distribution/**: working folder, with the final files for distribution that are the result of the package stage.

Maven, by convention, assumes specific folder paths known as [Standard Directory Layout](http://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html):
- sources should be under src/main/java/;
- resources should be under src/main/resources/;
- build will contain working files and folders, under target/;
- distribution will be at ~~target/classes/~~.

These default folder paths must be overridden to match this dojo folder structure ( and it's a good test on how hard it can be to not follow a convention ).

**Note**: it's possible to tell Maven to create an empty project of a given archetype, by issuing the following command:

```bash
mvn archetype:generate -DgroupId=[PACKAGE_PATH] -DartifactId=[APPLICATION_ID] -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
```

## 3.1. Empty Project

- An empty pom.xml that Maven can handle;
- ~~It doesn't have any tasks, besides the default tasks~~.

> The minimum requirement for a POM are the following:
- **project root**;
- **modelVersion**: should be set to 4.0.0;
- **groupId**: the id of the project's group;
- **artifactId**: the id of the artifact ( project )
- **version**: the version of the artifact under the specified group.

By default, Maven without any plugins offers the following ~~tasks~~:

- **init**: initializes a new Gradle build;
- **wrapper**: generates Gradle wrapper files;
- **tasks**: displays the tasks runnable from root project;
- **projects**: displays the sub-projects of root project;
- **components**: displays the components produced by root project.

**Note**: ~~this buildfile can actually be empty ( 0 bytes in size ) and Gradle copes with that, unlike Ant or Maven which require an empty XML content~~.

## 3.2. HelloWorld Project

- pom.xml, with one task: **greet**;
- It outputs the message "Hello, World!" to the console by using ```~~println~~``` command.

**Note**: ~~a task can have pre and post code blocks. These are executed before and after the task code block executes, respectively~~.

## 3.3. Java Project, build

- pom.xml with several ~~tasks, that should depend on variables set on maven.properties~~:
  - **clean**: by default the folder build/ is removed by task clean but since we're using a custom distribution/ folder it's necessary to override clean task configuration to also remove distribution/ folder and resources/** files;
  - ~~**initialize**: use ```mkdirs()``` method from Java **File** class to create working folders ( build/, distribution/ and reports/ )~~;
  - **compile**: depends on ```classes``` task and must override ```~~compileJava~~``` task to build the .class files, one for each .java file encoded in UTF-8 mode that exists inside sources/ folder ( among other specific options for javac ).

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

- pom.xml based on milestone 3 with a new task - **distribute** - that inherits from ```Copy``` task;
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

- pom.xml based on milestone 3 with new tasks:
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

## 3.6. Java Project, application WAR

- pom.xml based on milestone 3 with a new task - **distribute** - that inherits from ```Copy```;
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

- declare sub-projects, each with its pom.xml
- declare sub-project dependencies among each other
- declare common configuration for all sub-projects
- declare specific configuration for a subset of sub-projects
  - how to declare common configuration for a subset of sub-projects?
