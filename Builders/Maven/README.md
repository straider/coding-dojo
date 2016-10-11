coding-dojo / Builders / Maven
==============================

Dojo to learn and explore Maven, one of the Groovy Builder Tools.

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

Each milestone already has the necessary source files with Groovy classes and there's no need for dependency management.

## 1.2. Audience

This dojo is suitable to any programmer that wants to learn how to work with Maven in order to build Groovy projects.

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
