:: Groovy :: IDEs :: Eclipse ::
===============================

# Steps

- Set Workspace to $HOME/workspace/;
- Use workspace as default and do not ask again;
- Change Appearance to Dark Theme and enable animations;
- Install New Software:
    - Add repository [Groovy-Eclipse 4.6](http://dist.springsource.org/snapshot/GRECLIPSE/e4.6/) and select:
        - Groovy Compiler 2.4 Feature
        - Groovy-Eclipse Feature
    - Add repository [Cucumber-Eclipse](https://cucumber.io/cucumber-eclipse/update-site)
- Eclipse Marketplace:
    - Buildship Gradle Integration 1.0
    - Spock Plugin 2.13
    - Subversive - SVN team Provider 4.0.0
    - EclEmma Java Code Coverage 2.3.3
- Install Subversive Connectors:
    - Select SVN Kit 1.8.12
- Restart;
- Open Java Perspective;
- Window -> Customize Perspective -> Action Set Availability: Enable SVN and Team.

## Using Java Project

## Using Maven Project

## Using Gradle Project

## Using Groovy Project

- New Groovy Project:
    - Project Name: HelloWorldUsingGroovyProject
    - Location: [PROJECT_FOLDER]/CodingDojo/branches/Groovy/IDEs/Eclipse/HelloWorldUsingGroovyProject
    - Build Settings:
        - Remove src/
        - Create src/main/groovy/
        - Create src/test/groovy/
- In Java Perspective:
    - Create package com.github.straider.dojo.groovy.eclipse in src/main/groovy/;
    - Create package com.github.straider.dojo.groovy.eclipse in src/test/groovy/;
    - Create Groovy Class HelloWorld, with public static void main() method;
    - Create Groovy Test Case class HelloWorldTest with superclass GroovyTestCase that has HelloWorld class under test;
    - Allow JUnit 4 to be added to the classpath;
    - Follow TDD Rhythm: RED-GREEN-REFACTOR.

# Notes

- Dark Theme: Editor colour theme is not good;
- It requires manual Subversion synchronization;
- Does not help much in following TDD, since it works best if class under test already exists;
- Does not generate test method for method;
- Coverage report does not reach 100%.
