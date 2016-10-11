coding-dojo / Builders / Buildr
===============================

Dojo to learn and explore Buildr, one of the Groovy Builder Tools.

----

# 1. Introduction

> [Buildr](https://en.wikipedia.org/wiki/Apache_Buildr) is an open-source build system mainly intended to build Java applications, but capable of doing much more. It gives the developer the power of a full-blown scripting language ( Ruby ) while writing his or her build scripts, much missed in XML-based building environments like Apache Ant or Apache Maven.

> Buildr is based on Ruby's build system Rake, and uses Ruby as a scripting language. It uses some project automation idioms from Maven like automated artifact management (Buildr is out-of-box compatible with Maven's repositories). As opposed to more imperative style of build systems like Ant, Buildr takes a more declarative approach in describing the project automation logic (similarly to Maven).

Buildr key concepts are [projects](http://buildr.apache.org/projects.html) and [tasks]():
- **project**: a project definition requires four pieces of information: the project name, group identifier, version number and base directory;
- **task**:

> Buildr is a multi-platform tool. It runs on every operating system on which Java can be installed.

## 1.1. Goals & Objectives

The objective of this dojo is to learn [Buildr](https://http://buildr.apache.org/) by practice, using small and simple exercises to understand the main features of this build tool.

The goals, of each milestone, are to produce well-formed _buildfiles_ that deliver the required artifacts.

Each milestone already has the necessary source files with Groovy classes and there's no need for dependency management.

## 1.2. Audience

This dojo is suitable to any programmer that wants to learn how to work with Buildr in order to build Groovy projects.

## 1.3. History

## 1.4. Limitations

## 1.5. Features

- A simple way to specify projects, and build large projects out of smaller sub-projects;
- Pre-canned tasks that require the least amount of configuration, keeping the build script DRY and simple;
- Compiling, copying and filtering resources, JUnit/TestNG test cases, APT source code generation, Javadoc and more;
- A dependency mechanism that only builds what has changed since the last release;
- A drop-in replacement for Maven 2.0, Buildr uses the same file layout, artifact specifications, local and remote repositories;
- All your Ant tasks are belong to us! Anything you can do with Ant, you can do with Buildr;
- No overhead for building _plugins_ or configuration. Just write new tasks or functions;
- Buildr is Ruby all the way down. No one-off task is too demanding when you write code using variables, functions and objects;
- Simple way to upgrade to new versions;
- Did we mention fast?

----

# 2. Installation

> Buildr requires a Java JDK or JRE to be installed, ~~version 7~~ or higher, and Ruby.

To verify that the installation is successfully issue the following command:

```bash
buildr --version
```

## 2.1. Binaries

- Download latest stable version from [official site]();
- Extract it to a folder, for example: /DevKits/Java/buildr-1.3.4/;
- Fix PATH environment variable to include the bin/ sub-folder.

## 2.2. Gem

```bash
gem install buildr
```

----

# 3. Milestones
