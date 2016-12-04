:: Maven :: Sample Project Layout ::
====================================

# Overview

This project goal is to allow for a quick start of a new Maven based Java project.

It assumes that the project has mandatory Unit Tests and Integration Tests coded in Groovy. For that reason the pom.xml uses Maven SureFire and Maven FailSafe plugins that fail if no tests are found.

## How to use it?

After copying this sample project to a new folder then:
- Replace pom.xml content with sample-pom.xml content and edit it:
    - Replace [GROUP_ID];
    - Replace [ARTIFACT_ID];
    - Replace [PROJECT_NAME];
    - Replace [PROJECT_DESCRIPTION];
    - Replace [PROJECT_URL];
    - Replace [PACKAGING_TYPE];
    - Version is set to 1.0.0, if it's not suitable then replace this value too.
- Rename all folders with "rename.me" to the project package name;
- Replace DummyTest with proper JUnit test classes;
- Replace DummySpec with proper Spock specification classes;
- Replace dummy.feature with proper Cucumber features;
- Add steps logic to JavaSteps or GroovySteps.

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

It should suit most of the Java projects that rely on Maven as their builder.

It may not be suitable for projects with several modules, since these require a single parent pom.xml and multiple child pom.xml files.
