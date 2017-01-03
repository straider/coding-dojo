:: Maven :: Modules Project Layout ::
=====================================

# Overview

Since Maven does not allow from pom.xml inheritance or inclusion it seems that the most often used solution is to have a parent-pom project, which simply packages a pom with all common dependencies and plugins, and have each project depend on it.

This parent-pom artefact should be installed in the local Maven repository, from where each project can then download it.

## Structure

### parent-pom

This Maven project is of type **pom** and declares all generic / common dependencies and plugins.

The iterations to accomplish a suitable parent-pom artefact are:

- minimal "empty": enforce Maven version and clean;
- compile;
- compile and test;
- compile, test and verify;
- ~~compile, test, verify and deploy~~.

### child-project

This Maven project is a sample project, of type **jar**, that shows how to depend on parent-pom.

## How to use it?

Then, the usual Maven goals can be used.

### Clean

```bash
mvn clean
```

### Compile

To build the artifact, without running any tests, issue the following command:

```bash
mvn compile
```

### Test

To execute Unit Tests, using JUnit or Spock, issue the following command:

```bash
mvn test
```

### Package

To assemble the artifact issue the following command:

```bash
mvn package
```

To execute Integration Tests, using Cucumber, issue the following command:

### Verify

```bash
mvn verify
```

### Install

To install the artifact in local Maven repository issue the following command:

```bash
mvn install
```

## Scope

It should suit Java projects that rely on Maven as their builder, with children applications depending on a parent artifact.

# Challenges

- Should the parent-pom define dependency management nodes or simple declare all common dependencies?
- Should the parent-pom define plugin management nodes or simply declare all commonly used plugins?
- Should enforce encoding of sources and resources always in UTF-8?
- Should enforce that SureFire and FailSafe plugins have the same version?
- Should include the Maven Dependency Plugin to purge project dependencies from local repository and re-resolve them?
- Should the Maven Clean Plugin be used to always clean - causing full build intead of incremental build?
