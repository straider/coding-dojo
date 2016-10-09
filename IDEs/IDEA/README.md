:: Groovy :: IDEs :: IDEA ::
============================

# Steps

- Set UI theme to Darcula;
- Create Desktop Entry, for all users;
- Create Launcher Script as /usr/local/bin/idea;
- Tune:
    - Build Tools: Ant, Maven, Gradle
    - Version Control: Subversion, Git, GitHub
    - Test Tools: JUnit, TestNG, Coverage
    - Swing: enabled
    - Android: disabled
    - Other Tools: all
    - Plugin Development: disabled
- Featured Plugins:
    - Scala: do not install
    - IdeaVim: do not install
- Configure -> Plugins -> Install JetBrains plugin:
    - Spock Framework Enhancements
    - Cucumber for Groovy
- Restart

## Using Java Project

## Using Maven Project

## Using Gradle Project

## Using Groovy Project

- New Groovy Project:
    - Set Project SDK: $HOME/opt/Compilers/jdk/ ( or /usr/lib/jvm/java-7-oracle/ )
    - Set Groovy SDK: $HOME/opt/Interpreters/groovy
    - Project Name: HelloWorldUsingGroovyProject
    - Project Location: [PROJECT_FOLDER]/CodingDojo/branches/Groovy/IDEs/NetBeans/HelloWorldUsingGroovyProject/
- Edit Project Structure -> Modules:
    - Create main/groovy/ in src/
    - Create test/groovy/ in src/
    - Set src/main/ as Source Folder
    - Set src/test/ as Test Source Folder
- Create package com.github.straider.dojo.groovy.idea in src/main/groovy/;
- Create package com.github.straider.dojo.groovy.idea in src/test/groovy/;
- Create Groovy Class HelloWorld, with public static void main() method;
- Create Groovy JUnit Test class HelloWorldTest with superclass GroovyTestCase that has HelloWorld class under test;
- Follow TDD Rhythm: RED-GREEN-REFACTOR.

# Notes

- Does not help much in following TDD, since it works best if class under test already exists;
- Coverage report correct at 100%.
