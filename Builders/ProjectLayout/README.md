coding-dojo / Builders / ProjectLayout
======================================

# Overview

## Problem

Each time a new Java project is started one must make some decisions and execute the same initial steps:
- Decide which Build Tool to use: Ant, Maven or Gradle?
- Code the bare minimal into each buildfile;
- Change buildfiles for specific project dependencies, requirements and tasks.

How long does it take to kickstart a project, like HelloWorld or PigLatin with Unit Tests and Integration Tests, using:
- Ant: Create build.xml and ant.properties in FIXME minutes?
- Maven: Create pom.xml (with maven.properties) in FIXME minutes?
- Gradle: Create build.gradle with gradle.properties in FIXME minutes?

## Goal & Objectives

This kata aims to provide a generic bare minimal Java project with just one deliverable artifact, with ready-made buildfiles for Ant, Maven and Gradle.

The project is ready to:
- Compile sources into JARs, WARs, EARs;
- Include resources, if available;
- Execute Unit Tests;
- Execute Integration Tests;
- Generate Testing and Coverage reports.

The sources are supposed to be encoded in UTF-8 and the Java version to use is 6.
These are set as properties of each Build Tool.

## Scope

The testing framework to use is JUnit, with Mockito and PowerMockito.
The coverage framework to use is JaCoCo.

It's out of scope to deal with specific needs of non generic projects or projects with multiple artifacts.
Projects that create a runnable JAR usually require a launch task as well and this is too out of scope.

## Audience

This kata is meant for Java programmers. Lazy Java programmers that wish not to spend much time on unnecessary fluff.

## Caveats & Pitfalls

- Must keep plugin versions, for Maven and Gradle, updated with latest stable releases;
