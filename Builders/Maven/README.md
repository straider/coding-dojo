coding-dojo / Builders / Maven
==============================

Dojo to learn and explore Maven, one of the Java Builder Tools.

----

# 1. Introduction

> [Maven](http://en.wikipedia.org/wiki/Maven) is a build automation tool used primarily for Java projects. The word maven means _accumulator of knowledge_ in Yiddish. Maven addresses two aspects of building software: First, it describes how software is built, and second, it describes its dependencies. Contrary to preceding tools like Apache Ant, it uses conventions for the build procedure, and only exceptions need to be written down.

> An XML file describes the software project being built, its dependencies on other external modules and components, the build order, directories, and required plug-ins. It comes with pre-defined targets for performing certain well-defined tasks such as compilation of code and its packaging.

Maven key concepts are:
- The pom.xml file - [Project Object Model](http://maven.apache.org/guides/introduction/introduction-to-the-pom.html) - is the core of a project's configuration in Maven. It is a single configuration file that contains the majority of information required to build a project in just the way you want. The POM is huge and can be daunting in its complexity, but it is not necessary to understand all of the intricacies just yet to use it effectively;
- **Profiles**: usuful to setup different configuration per working environment, such as DEV, TST, STG and PRD;
- **Lifecycles**: are a list of [named phases](http://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html) that can be used to give order to goal execution. The specific goal executed per phase is dependent upon the packaging type of the project. Maven defines 3 [lifecycles](http://maven.apache.org/ref/3.3.3//maven-core/lifecycles.html): **default**, **clean** and **site**. Goals provided by plugins can be associated with different phases of the lifecycle;
- **Plugins**.

> Maven is actually a plugin execution framework where every task is actually done by plugins. A plugin generally provides a set of goals and which can be executed using following syntax:

```bash
mvn [plugin-name]:[goal-name]
```

> Maven is a multi-platform tool. It runs on every operating system on which Java can be installed.

> Using Maven, the user provides only configuration for the project, while the configurable plug-ins do the actual work of compiling the project, cleaning target directories, running unit tests, generating API documentation and so on. In general, users should not have to write plugins themselves. Contrast this with Ant and Make, in which one writes imperative procedures for doing the aforementioned tasks.

Neal Ford, Director, Software Architect, and Meme Wrangler at ThoughtWorks, has a post with the title [Why Everyone (Eventually) Hates (or Leaves) Maven](http://nealford.com/memeagora/2013/01/22/why_everyone_eventually_hates_maven.html) where he points out two sides of build tools: contextual, such as Maven, and composable, such as Rake or Gradle.

> Maven is a project management and comprehension tool.

> Maven provides developers a complete build lifecycle framework.

> Development team can automate the project's build infrastructure in almost no time as Maven uses a standard directory layout and a default build lifecycle.

> In case of multiple development teams environment, Maven can set-up the way to work as per standards in a very short time.

> As most of the project setups are simple and reusable, Maven makes life of developer easy while creating reports, checks, build and testing automation setups.

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
- Must be compliant with [schema 4.0.0](http://maven.apache.org/xsd/maven-4.0.0.xsd);
- It doesn't include any plugins, therefor has no goals, besides the default ones.

> The minimum requirement for a POM are the following:
- **project root**;
- **modelVersion**: should be set to 4.0.0;
- **groupId**: the id of the project's group;
- **artifactId**: the id of the artifact ( project )
- **version**: the version of the artifact under the specified group.

If not, then Maven complains with:

```bash
[FATAL] Non-readable POM ...
```

By default, Maven without any plugins offers a complete set of phases and goals, which can be seen by the output of the following command:

```bash
mvn help:effective-pom
```

## 3.2. HelloWorld Project

- pom.xml, with one goal, **greet**, for phase **greet**;
- It outputs the message "Hello, World!" to the console by using ```~~echo~~``` command.

**Note**: this seems to be possible only by coding a new Maven Plugin!

## 3.3. Java Project, build

- pom.xml with several improved goals~~, that should depend on variables set on maven.properties~~:
  - **clean**: by default the folder build/ is removed by task clean but since we're using a custom distribution/ folder it's necessary to override the clean goal of clean phase to also remove distribution/ folder and resources/** files;
  - ~~**initialize**: should working folders ( build/, distribution/ and reports/ ) be created before hand~~?
  - **compile**: override compile goal of lifecycle build to set sources encoded in UTF-8 mode in sources/ folder ( among other specific options for javac ), instead of the usual folder src/ ( by convention ).

**Note**: it's necessary to change configuration of [**maven-compiler-plugin**](http://maven.apache.org/plugins/maven-compiler-plugin/). Although there is a [**properties-maven-plugin**](http://www.mojohaus.org/properties-maven-plugin/) it's not fully working.

**Questions**:

- how to keep the plugin up-to-date?
- how to properly set bootclasspath? Is it really necessary, in Maven?

## 3.4. Java Project, library JAR

- pom.xml based on milestone 3 with an improved **package** goal, which must be reconfigured to build the final JAR file, with a complete MANIFEST.INF:
  - Implementation-Title: Dojo Java Builders - Maven
  - Implementation-Version: 1.0.0
  - Implementation-Vendor: DoWeDo-IT
  - Implementation-Timestamp: current date and time;
  - Built-Date: current date and time;
  - Built-By: username.
- The final JAR file must be copied to distribute/ folder. To do this it's necessary to include plugin [**maven-dependency-plugin**](http://maven.apache.org/plugins/maven-dependency-plugin/) and configure an execution of **copy** goal to copy the artifact JAR from its usual location to distribution/ folder and rename it.

**Note**: it's necessary to change the configuration of [**maven-jar-plugin**](http://maven.apache.org/plugins/maven-jar-plugin/). This plugin already [knows plenty](http://maven.apache.org/shared/maven-archiver/index.html) on how to add content to a MANIFEST.INF file:

- addDefaultImplementationEntries;
- mainClass;
- addClasspath;
- manifestEntries, a list of key-value pairs.

It also adds an INDEX.LIST file and a maven/ folder to the META_INF/ folder of the JAR.

To calculate build-time it is necessary to add a property:

```xml
...
  <properties>
    ...
    <build-time>${maven.build.timestamp}</build-time>
    <maven.build.timestamp.format>yyyy-MM-dd HH:mm:ss</maven.build.timestamp.format>
  </properties>
...
```

**Questions**:

- how to include source files in the final JAR?

There is a plugin that also creates a JAR file with the sources, in the validate phase. This plugin is [maven-source-plugin](http://maven.apache.org/plugins/maven-source-plugin/) and it adds the following goals:

- **source:aggregate**: aggregates sources for all modules in an aggregator project;
- **source:jar**: is used to bundle the main sources of the project into a jar archive;
- **source:test-jar**: is used to bundle the test sources of the project into a jar archive;
- **source:jar-no-fork**: is similar to jar but does not fork the build lifecycle;
- **source:test-jar-no-fork**: is similar to test-jar but does not fork the build lifecycle.

## 3.5. Java Project, runnable JAR

- pom.xml based on milestone 4 with improved goals:
  - **package** that creates a MANIFEST.INF file that states which is the main class and what are the libraries that it depends on runtime - located in distribution/libraries/ folder:
      - Implementation-Title: Dojo Java Builders - Maven
      - Implementation-Version: 1.0.0
      - Implementation-Vendor: DoWeDo-IT
      - Implementation-Timestamp: current date and time;
      - Built-Date: current date and time;
      - Built-By: username.
      - Main-Class: fully qualified class name, with its package name, of the main class ( the one that defines the ```main()``` method );
      - Class-Path: list of 3rd party libraries, separated by whitespace, that are required at runtime.
  - **exec** that executes the code of main method in the main class, from the distribution/ folder. To do this it's necessary to configure an execution of the **exec** goal provided by the [**exec-maven-plugin**](http://www.mojohaus.org/exec-maven-plugin/), associating it to phase **install**.

**Note**: although it's possible to set different values for the execution arguments it's not possible to pass arguments to the main class through the command-line, because each argument on the command-line is seen by Maven as a phase or phase:goal to execute.

**Questions**:

- how to copy runtime dependency libraries to distribution/ folder?
- how to execute with different arguments?

## 3.6. Java Project, application WAR

- pom.xml similar to milestone 4, but with a packaging type of WAR instead of JAR and with an improved **package** goal, which must be reconfigured to build the final WAR file;
- Add tag failOnMissingWebXml to disable inclusion of web.xml;
- The final WAR file must be copied to distribute/ folder.

**Note**: it's necessary to change the configuration of [**maven-war-plugin**](http://maven.apache.org/plugins/maven-war-plugin/). This plugin already [knows plenty](http://maven.apache.org/shared/maven-archiver/index.html) on how to add content to a MANIFEST.INF file:
  - Implementation-Title: Dojo Java Builders - Maven
  - Implementation-Version: 1.0.0
  - Implementation-Vendor: DoWeDo-IT
  - Implementation-Timestamp: current date and time;
  - Built-Date: current date and time;
  - Built-By: username.

**Note**: the **war** goal usually includes resources, such as web.xml, from resources/ folder, into the WEB-INF/ folder in the WAR file. More complex WAR files will also require other resources put into WEB-INF/lib/ or WEB-INF/classes/META-INF/ folders.

If the inclusion of web.xml is not disabled then Maven ends with the following error:

```
Error assembling WAR: webxml attribute is required
(or pre-existing WEB-INF/web.xml if executing in update mode)
```

## 3.7. Java Project, application EAR

## 3.8. Java Project, with Sub-Projects

- declare sub-projects, each with its pom.xml
- declare sub-project dependencies among each other
- declare common configuration for all sub-projects
- declare specific configuration for a subset of sub-projects
  - how to declare common configuration for a subset of sub-projects?
