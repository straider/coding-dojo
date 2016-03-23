coding-dojo / Builders / Bazel
==============================

Dojo to learn and explore Bazel, one of the Java Builder Tools.

----

# 1. Introduction

## 1.1. Goals & Objectives

## 1.2. Audience

This dojo is suitable to any programmer that wants to learn how to work with Bazel in order to build Java projects.

## 1.3. History

## 1.4. Limitations

## 1.5. Features

----

# 2. Installation

## 2.1. Binaries

## 2.2. Sources

----

# 3. Milestones

Each milestone should improve the content of the buildfiles - ~~**build.gradle**, **gradle.properties** and **settings.gradle**~~ - upon the content of the previous one. This means that's wise to copy the buildfiles of the previous milestone into the current milestone and just do some minor editions to the content, instead of having to type everything all over again.

**Note** the folder structure, of each milestone, is:

- **sources/**: it contains the necessary source files with Java classes;
- **resources/**: it contains, when needed, the files with meta-code or files such as images, documents, etc.;
- **tests/**: it contains the optional source files with Java test classes, to validate the main source code;
- **reports/**: it contains, after execution of tests, the validation report files;
- **build/**: working folder, with the temporary *.class files that are the outcome of the build stage;
- **distribution/**: working folder, with the final files for distribution that are the result of the package stage.

~~Bazel, by convention, assumes specific folder paths for its sourceSets:~~
- sources should be under src/main/java/;
- resources should be under src/main/resources/;
- build will contain working files and folders, under build/;
- distribution will be at build/libs/.

These default folder paths must be overridden to match this dojo folder structure ( and it's a good test on how hard it can be to not follow a convention ).

## 3.1. Empty Project

## 3.2. HelloWorld Project

## 3.3. Java Project, build

## 3.4. Java Project, library JAR

## 3.5. Java Project, runnable JAR

## 3.6. Java Project, application WAR

## 3.7. Java Project, application EAR

## 3.8. Java Project, with Sub-Projects
