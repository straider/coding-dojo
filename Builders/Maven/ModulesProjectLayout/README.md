:: Maven :: Modules Project Layout ::
=====================================

# Overview

This project goal is to allow for a quick start of a new Maven based Java project with multiple modules.

It assumes that the project has mandatory Unit Tests and Integration Tests coded in Groovy. For that reason the pom.xml uses Maven SureFire and Maven FailSafe plugins that fail if no tests are found.

## Structure

### parent-pom

### module-pom

## How to use it?

After copying this sample project to a new folder then:
- Replace pom.xml content with sample-parent-pom.xml content and edit it:
    - Replace [GROUP_ID];
    - Replace [PARENT_ARTIFACT_ID];
    - Replace [PROJECT_NAME];
    - Replace [PROJECT_DESCRIPTION];
    - Replace [PROJECT_URL];
    - Version is set to 1.0.0, if it's not suitable then replace this value too;
    - Add all necessary modules to <modules> section.
    
Then, copy the sample module/ folder to a new folder, one for each module, and then:
- Replace pom.xml content with sample-module-pom.xml content and edit it:
    - Replace [GROUP_ID];
    - Replace [PARENT_ARTIFACT_ID];
    - Replace [MODULE_ARTIFACT_ID];
    - Replace [MODULE_NAME];
    - Replace [MODULE_DESCRIPTION];
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

To build the artifacts, without running any tests, issue the following command:

```bash
mvn compile
```

### Test

To execute Unit Tests, using JUnit or Spock, issue the following command:

```bash
mvn test
```

### Package

To assemble the artifacts issue the following command:

```bash
mvn package
```

To execute Integration Tests, using Cucumber, issue the following command:

### Verify

```bash
mvn verify
```

### Install

To install the artifacts in local Maven repository issue the following command:

```bash
mvn install
```

## Scope

It should suit Java projects with multiple modules that rely on Maven as their builder.

It may not be suitable for projects that depend on external parent pom.xml file.

# Challenges
