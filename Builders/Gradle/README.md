coding-dojo / Builders / Gradle
===============================

Dojo to learn and explore Gradle, one of the Groovy Builder Tools.

----

# 1. Introduction

> [Gradle](http://en.wikipedia.org/wiki/Gradle) is a project automation tool that builds upon the concepts of Apache Ant and Apache Maven and introduces a Groovy-based domain-specific language (DSL) instead of the more traditional XML form of declaring the project configuration.

> Gradle is a multi-platform tool. It runs on every operating system on which Java can be installed.

> Gradle was designed for multi-project builds which can grow to be quite large, and supports incremental builds by intelligently determining which parts of the build tree are up-to-date, so that any task dependent upon those parts will not need to be re-executed.

Neal Ford, Director, Software Architect, and Meme Wrangler at ThoughtWorks, has a post with the title [Why Everyone (Eventually) Hates (or Leaves) Maven](http://nealford.com/memeagora/2013/01/22/why_everyone_eventually_hates_maven.html) where he points out two sides of build tools: contextual, such as Maven, and composable, such as Rake or Gradle.

## 1.1. Goals & Objectives

The objective of this dojo is to learn [Gradle](https://gradle.org/) by practice, using small and simple exercises to understand the main features of this build tool.

The goals, of each milestone, are to produce well-formed _buildfiles_ that deliver the required artifacts.

Each milestone already has the necessary source files with Groovy classes and there's no need for dependency management.

## 1.2. Audience

This dojo is suitable to any programmer that wants to learn how to work with Gradle in order to build Groovy projects.

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

To verify that the installation is successfully issue the following command:

```bash
gradle --version
```

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
