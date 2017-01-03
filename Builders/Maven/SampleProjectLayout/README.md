:: Maven :: Sample Project Layout ::
====================================

# Overview

This project goal is to allow for a quick start of a new Maven based Java project.

It assumes that the project has mandatory Unit Tests and Integration Tests coded in Groovy. For that reason the pom.xml uses Maven SureFire and Maven FailSafe plugins that fail if no tests are found.

This project can be used as a scaffold for a real project.

The main files and folders are:

| Folder                          | File             | Description                                   |
|---------------------------------|------------------|-----------------------------------------------|
| /                               | pom.xml          | Main Maven buildfile.                         |
| /                               | maven.properties | Optional set of properties for the buildfile. |
| /                               | LICENSE.txt      | Plain text format of the project license.     |
| /                               | README.md        | Main document.                                |
| src/                            |                  | Top folder of all project sources.            |
| src/main/                       |                  | Top folder for production code.               |
| src/main/java/                  |                  | Java production source code.                  |
| src/main/resources/             |                  | Folder with production ready resources.       |
| src/test/                       |                  | Top folder for testing code.                  |
| src/test/unit/java/             |                  | Java unit testing source code.                |
| src/test/unit/groovy/           |                  | Groovy unit testing source code.              |
| src/test/integration/java/      |                  | Java integration testing source code.         |
| src/test/integration/groovy/    |                  | Groovy integration testing source code.       |
| src/test/integration/resources/ |                  | Folder with integration testing resources.    |

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

# Challenges

- How to handle external Maven properties file? 
> Use [Maven Properties](http://www.mojohaus.org/properties-maven-plugin/) plugin, per environment (which could be controlled by profiles). But is not useful to replace POM properties used in dependencies or plugins.

- Is it better to have src/main/ and src/test/, with unit/ and integration/, or to have src/main/, src/unit-test/ and src/integration-test/?
> Choice, without any strong reason, is to use src/main/ and src/test/, with unit/ and integration/.

- Use of [Maven Surefire](https://maven.apache.org/surefire/maven-surefire-plugin/) and [Maven Failsafe](https://maven.apache.org/surefire/maven-failsafe-plugin/) plugins:
    - The Surefire Plugin is used during the test phase of the build lifecycle to execute the unit tests of an application. It's designed for running unit tests and if any of the tests fail then it will fail the build immediately;
    - The Failsafe Plugin is designed to run integration tests while the Surefire Plugin is designed to run unit tests. It's designed for running integration tests and decouples failing the build if there are test failures from actually running the tests.
- How to properly copy resources from src/ to target/?
> Use [Maven Resources](https://maven.apache.org/plugins/maven-resources-plugin/) plugin;
- Can pom.xml be split into distinct files, per functionalities, and add only the ones needed?
    - Deliver library artefact (JAR);
    - Deliver application runnable artefact (JAR, with MANIFEST.INF);
    - Deliver web application artefact (WAR);
    - Deliver enterprise application artefact (EAR);
    - Control servers (Tomcat, jetty, GlassFish, ...).
