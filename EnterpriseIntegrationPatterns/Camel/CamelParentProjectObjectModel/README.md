:: Camel :: Parent Project ::
=============================

# Overview

This kata aims to provide a fast Maven and Gradle project for Camel applications.

Instead of copying and pasting from one Camel application to the next, propagating deficiencies and faults it is best to rely on a strong foundation to be the base of faster time-to-deliver Camel applications. The focus should be on the Camel application logic and not on the boilerplate meta-code that is nevertheless a requirement to help build, test and deploy these applications.

# Structure

## Project Layout

The Maven / Gradle project that inherit from this Camel Parent Project should have Java production code with Groovy testing code and following this layout:

- /: top level project folder:
    - src/: mandatory code folder:
        - main/: top level production code folder:
            - java/: production code in Java;
            - groovy/: optionally, production code in Groovy;
            - resources/: required resources to be deployed in execution environments.
        - test/: top level testing code folder:
            - unit/:
                - groovy/: unit test code in Groovy.
            - integration/:
                - groovy/: integration test code in Groovy;
                - resources/: resources required for testing purposes.                
    - target/: output folder for Maven based builds;
    - build/: output folder for Gradle based builds.
    - pom.xml: Maven build file (should be copied from the sample-child-pom.xml);
    - build.grade: Gradle build file, which should depend on gradle.properties and could depend on settings.gradle
    
## Common Dependencies

| Dependency | Version        | Scope   | Description | URL  |
|------------|----------------|---------|-------------|------|
| Groovy     | 2.4.7          | test    |             | []() |
| JUnit      | 4.12           | test    |             | []() |
| Hamcrest   | 1.3            | test    |             | []() |
| Mockito    | 1.10.19        | test    |             | []() |
| Spock      | 1.0-groovy-2.4 | test    |             | []() |
| Cucumber   | 1.2.4          | test    |             | []() |
| Log4J      | 1.2.17         | test    |             | []() |
| SLF4J      | 1.7.21         | test    |             | []() |
| Camel      | 2.17.3         | compile |             | []() |

## Common Plugins

### Maven

| Plugin                  | Version  | Description | URL  |
|-------------------------|----------|-------------|------|
| Maven Enforcer          | 1.4.1    |             | []() |
| Maven Clean             | 3.0.0    |             | []() |
| Maven Compiler          | 3.6.0    |             | []() |
| Maven Resources         | 3.0.1    |             | []() |
| Maven Source            | 3.0.1    |             | []() |
| Maven SureFire          | 2.19.1   |             | []() |
| Maven FailSafe          | 2.19.1   |             | []() |
| Groovy Eclipse Compiler | 2.9.2-01 |             | []() |
| Groovy Eclipse Batch    | 2.4.3-01 |             | []() |
| Build Helper            | 1.12     |             | []() |

### Gradle

| Plugin                  | Version | Description | URL  |
|-------------------------|---------|-------------|------|
|                         |         |             | []() |

