:: SQL :: Migrations :: Flyway ::
=================================

# Overview

> [Flyway](https://flywaydb.org/) is the Apache v2 licensed open-source tool that makes database migrations easy. Flyway has been designed from day one to be easy to setup and simple to master. It strongly favors simplicity and convention over configuration. It achieves this by focusing on one problem only and solving it well. Flyway has been built from the ground up for continuous delivery.

> It is based around just 6 basic commands: Migrate, Clean, Info, Validate, Baseline and Repair. Migrations can be written in SQL (database-specific syntax) or Java (for advanced data transformations or dealing with LOBs). It has a Command-line client. Alternatively, you can also use the Maven plugin, Gradle plugin, SBT plugin or the Ant tasks.

> You can think of Flyway as version control for your database. It lets you evolve your database schema easily and reliably across all your instances. 

## Features

- Migrations can be written in SQL or Java;
    - Does not understand YAML / JSON or XML migrations;
    - Migrations direction is only up, there's no down (rollback).
- Understands repeatable migrations;
- Allows to hook into its lifecycle with Callbacks;
- Besides the command line client there are plugins for Ant, Maven, Gradle and more;
- Apache V2 license.

## Scope

## Audience

## History

# Resources

## Articles

- [Flyway - Database Java Migration Open Source Framework](http://www.methodsandtools.com/tools/flyway.php)
- [Easy Database Migrations using Flyway, Java EE 6 and GlassFish](http://www.hascode.com/2013/04/easy-database-migrations-using-flyway-java-ee-6-and-glassfish/)
- [Database Migrations with Flyway](http://www.baeldung.com/database-migrations-with-flyway)
- [How to execute the upgrade process for your Java program by using Flyway](https://hainguyen.mycollab.com/how-to-perform-upgrade-a-java-program-flyway/)
- [Integrating Flyway In A Spring Framework Application](http://blog.trifork.com/2014/12/09/integrating-flywaydb-in-a-spring-framework-application/)
- [Combining the power of Gradle, Flyway and JOOQ for seamless development with databases](http://coders-kitchen.com/2016/04/25/combining-the-power-of-gradle-flyway-and-jooq-for-seamless-development-with-databases/)
- [Flyway and jOOQ for Unbeatable SQL Development Productivity](https://blog.jooq.org/tag/database-migration/)
- [Flyway: DB Migration In Continuous Integration Process](https://www.romexsoft.com/blog/flyway-db-migration/)
- [Lessons Learned Using Flyway DB with Distributed Version Control](http://www.jeremyjarrell.com/using-flyway-db-with-distributed-version-control/)

## Tutorials

## Books

## Tools

### Ant

[Flyway Ant Tasks](https://flywaydb.org/documentation/ant/)

### Maven

[Flyway Maven Plugin](https://flywaydb.org/documentation/maven/)

### Gradle

[Flyway Gradle Plugin](https://flywaydb.org/documentation/gradle/) (before was [gradle-flyway-plugin](https://github.com/ben-manes/gradle-flyway-plugin))

### Grails

- [grails-flyway-plugin](https://github.com/daniel-lima/grails-flyway-plugin)
- [GFlyway2](https://github.com/Vav1lon/GFlyway2): Flyway 2 plugin for Grails
    - [Grails Flyway 2 Plugin](https://grails.org/plugin/gflyway2)
- [grails-flyway](https://github.com/saw303/grails-flyway): provides Flyway support for Grails 3 applications
    - [Using Grails 3 Flyway Plugin for database migrations](https://www.wangler.io/blog/2016/grails-flyway-plugin.html)
