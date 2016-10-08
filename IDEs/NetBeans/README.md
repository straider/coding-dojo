:: Groovy :: IDEs :: NetBeans ::
================================

# Steps

- Install Plugins:
    - Dark Theme
    - [Gradle Support 1.3.9](https://github.com/kelemen/netbeans-gradle-project)
    - [QuBiT's Cucumber Editor Module for Netbeans 1.8.2](https://github.com/QuBiT/cucumber-netbeans-plugin)
    - [Java Code Coverage for NetBeans 1.5.2](https://github.com/jonathanlermitage/tikione-jacocoverage)
- Deactivate Plugins:
    - Hudson
    - Hudson UI
    - Docker Editor
    - Docker UI
    - Bugzilla
    - Mercurial
    - AngularJS
- Restart.

## Using Java Project

- New Java Project -> Java Class Library:
    - Project Name: HelloWorldUsingJavaProject
    - Project Location: [PROJECT_FOLDER]/CodingDojo/branches/Groovy/IDEs/NetBeans/
    - Do not create Main Class
- Files:
    - Create main/groovy/ in src/
    - Create test/groovy/ in src/
- Edit Project Properties:
    - Sources:
        - Change Source Package Folder to src/main/groovy/
        - Change Test Package Folder to src/test/groovy/
    - Libraries:
        - Add Groovy 2.1.7 to Compile
        - Add JUnit 4.12 and Hamcrest 1.3 to Compile Tests
- Create package com.github.straider.dojo.groovy.netbeans in src/main/groovy/;
- Create package com.github.straider.dojo.groovy.netbeans in src/test/groovy/;
- Create Groovy JUnit Test class HelloWorldTest with superclass GroovyTestCase that has HelloWorld class under test;
- Create Groovy Class HelloWorld, with public static void main() method;
- Follow TDD Rhythm: RED-GREEN-REFACTOR.

## Using Maven Project

## Using Gradle Project

## ~~Using Groovy (Grails) Project~~

- New Groovy Project:
    - Project Name: HelloWorldUsingGroovyProject
    - Project Location: [PROJECT_FOLDER]/CodingDojo/branches/Groovy/IDEs/NetBeans/
- Must Configure Grails!

# Notes

- Subversion is supported by default and it automatically ignores local and private files;
- [Groovy](https://netbeans.org/features/groovy/) and Grails supported by default, but no Groovy only Project template;
- No Spock Plugin;
- No support for Groovy code coverage;
- Ant task requires Main Class with runnable method;
- Does not generate test method for method;
- Does not allow to run test method - it runs the entire file.
