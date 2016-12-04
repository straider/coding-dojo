:: Maven :: Sample Project Layout ::
====================================

# Overview

This project goal is to allow for a quick start of a new Maven based Java project.

It assumes that the project has mandatory Unit Tests and Integration Tests coded in Groovy. For that reason the pom.xml uses Maven SureFire and Maven FailSafe plugins that fail if no tests are found.

## How to use it?

After copying this sample project to a new folder then:
- Edit pom.xml:
    - Replace [GROUP_ID];
    - Replace [ARTIFACT_ID];
    - Replace [PROJECT_NAME];
    - Replace [PROJECT_DESCRIPTION];
    - Replace [PROJECT_URL];
    - Replace [PACKAGING_TYPE];
    - Version is set to 1.0.0, if it's not suitable then replace this value too.
- Rename all folders with "rename-me" to the project package name.

## Scope

It should suit most of the Java projects that rely on Maven as their builder.

It may not be suitable for projects with several modules, since these require a single parent pom.xml and multiple child pom.xml files.
