:: SQL :: Migrations ::
=======================

# Overview

> In software engineering, [schema migration](https://en.wikipedia.org/wiki/Schema_migration) (also database migration, database change management) refers to the management of incremental, reversible changes to relational database schemas. A schema migration is performed on a database whenever it is necessary to update or revert that database's schema to some newer or older version. Migrations are performed programmatically by using a schema migration tool. When invoked with a specified desired schema version, the tool automates the successive application or reversal of an appropriate sequence of schema changes until it is brought to the desired state.

> [Data migration](https://en.wikipedia.org/wiki/Data_migration) is the process of transferring data between computer storage types or file formats. It is a key consideration for any system implementation, upgrade, or consolidation. Data migration is usually performed programmatically to achieve an automated migration, freeing up human resources from tedious tasks.

## Scope

## Audience

# Resources

- [Evolutionary Database Design](http://martinfowler.com/articles/evodb.html)
- [Database Best Practices](http://wiki.c2.com/?DatabaseBestPractices)
- Coding Horror:
    - [Is Your Database Under Version Control?](https://blog.codinghorror.com/is-your-database-under-version-control/)
    - [Get Your Database Under Version Control](https://blog.codinghorror.com/get-your-database-under-version-control/)
- [Three Rules for Database Work](http://odetocode.com/blogs/scott/archive/2008/01/30/three-rules-for-database-work.aspx)
    - [Versioning Databases – The Baseline](http://odetocode.com/blogs/scott/archive/2008/01/31/versioning-databases-the-baseline.aspx)
    - [Versioning Databases – Change Scripts](http://odetocode.com/blogs/scott/archive/2008/02/02/versioning-databases-change-scripts.aspx)
    - [Versioning Databases – Views, Stored Procedures, and the Like](http://odetocode.com/blogs/scott/archive/2008/02/02/versioning-databases-views-stored-procedures-and-the-like.aspx)
    - [Versioning Databases – Branching and Merging](http://odetocode.com/blogs/scott/archive/2008/02/03/versioning-databases-branching-and-merging.aspx)

## Books

- [Database refactoring](http://databaserefactoring.com/index.html) is a technique which enables Continuous Delivery
    - [Refactoring Databases: Evolutionary Database Design](https://www.amazon.com/gp/product/0321774515/)
    - [Recipes for Continuous Database Integration](https://www.amazon.com/gp/product/B000RH0EI4/)

## Tools

### Ruby

- [Active Record Migrations](http://edgeguides.rubyonrails.org/active_record_migrations.html)
    - [ActiveRecord Stand-alone Migrations](https://github.com/rosenfeld/active_record_migrations)
    - [Standalone Migrations](https://github.com/thuss/standalone-migrations)
    - [Farfugl](https://github.com/hph/farfugl)
- [Sequel Migrations](http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html)
- [DBGeni](http://dbgeni.appsintheopen.com/) is a command line utility that is implemented using Ruby and installed as a Ruby gem.
- [XMigra](https://github.com/rtweeks/xmigra)

### Python

- [simple-db-migrate](https://github.com/guilhermechapiewski/simple-db-migrate)
- [Alembic](http://alembic.zzzcomputing.com/) is a database migrations tool written by the author of SQLAlchemy.

### Perl

- [Sqitch](http://sqitch.org/)

### PHP

- [Ladder](https://www.drarok.com/ladder/) is a (deprecated) database migration system for MySQL databases, written in PHP.
- [Ladder 2](https://github.com/drarok/ladder2)
- [DBSteward](https://github.com/nkiraly/DBSteward)
- [Phinx](https://phinx.org/)
- [dbdeploy](http://dbdeploy.com/)
- [dbv](https://dbv.vizuina.com/)
    - [dbv](https://github.com/victorstanciu/dbv): Database version control, made easy!

### Javascript

- [Knex.js Migrations](http://knexjs.org/#Migrations)
- []()

### .NET

- [dbdeploy](http://dbdeploy.com/)
- [FluentMigrator](https://github.com/schambers/fluentmigrator/)
- [octalforty-wizardby](https://code.google.com/archive/p/octalforty-wizardby/) is a powerful yet easy to use database continuous integration & schema migration framework primarily targeting .NET.
- [DBSourceTools](http://dbsourcetools.codeplex.com/) is a GUI utility to help developers bring SQL Server databases under source control.

### Java

- [openDBcopy](http://opendbcopy.sourceforge.net/) is a universal database utility to migrate data from and to any database given a JDBC driver.
- [Migrator](http://migrator.sourceforge.net/)
    - [Migrator: ActiveRecord Migrations in Java](http://www.jroller.com/obie/entry/migrator_activerecord_migrations_in_java)
- [migrate4j](http://migrate4j.sourceforge.net/)
- [dbmigrate](https://code.google.com/archive/p/dbmigrate/)
- [dbdeploy](http://dbdeploy.com/)
    - [dbdeploy](https://code.google.com/archive/p/dbdeploy/)
    - [database schema evolution versus schema versioning](https://oschmi.blogspot.co.uk/2012/02/database-schema-evolution-versus-schema.html)
- [DbMaintain](http://www.dbmaintain.org/overview.html)
- [Dbpatch](https://github.com/m-szalik/dbpatch): Manage versioning of your databases with maven, gradle or standalone GUI application
- [MyBatis Migrations](http://www.mybatis.org/migrations/)
    - [MyBatis Migrations](https://github.com/mybatis/migrations) @ GitHub
- [Flyway](https://flywaydb.org/)
    - [Lessons Learned Using Flyway DB with Distributed Version Control](http://www.jeremyjarrell.com/using-flyway-db-with-distributed-version-control/)
    - [Easy Database Migrations using Flyway, Java EE 6 and GlassFish](http://www.hascode.com/2013/04/easy-database-migrations-using-flyway-java-ee-6-and-glassfish/)
    - [Flyway and jOOQ for Unbeatable SQL Development Productivity](https://blog.jooq.org/tag/database-migration/)
- [Liquibase](http://www.liquibase.org/)
    - [Liquibase](https://github.com/liquibase)
    - [groovy-liquibase](https://github.com/tlberglund/groovy-liquibase): Yet Another Groovy DSL for Liquibase
    - [liquibase-groovy-dsl](https://github.com/liquibase/liquibase-groovy-dsl): official Groovy DSL for Liquibase
    - [Agile database migrations with Liquibase: How I learned to love my inner DBA](http://techbeacon.com/agile-database-migrations-liquibase-how-i-learned-love-my-inner-dba)


#### Ant

- [DbMaintain Ant Tasks](http://www.dbmaintain.org/ant-tasks.html)
- [Flyway Ant Tasks](https://flywaydb.org/documentation/ant/)
- [Liquibase Ant Tasks](http://www.liquibase.org/documentation/ant/index.html)

#### Maven

- [DbMaintain Maven Goals](http://www.dbmaintain.org/maven-goals.html)
- [Dbpatch Maven Plugin](https://github.com/m-szalik/dbpatch/tree/master/how-to-use-example/with-maven)
- [Carbon Five Database Migration](https://code.google.com/archive/p/c5-db-migration/)
    - [Continuous DB migration based on carbon5 framework](http://www.slideshare.net/b0ris_1/btrofimov-dbmigrationodjug)
    - [Java Database Migrations](http://blog.carbonfive.com/2008/09/03/java-database-migrations/)
- [Flyway Maven Plugin](https://flywaydb.org/documentation/maven/)
- [Maven Liquibase Plugin](http://www.liquibase.org/documentation/maven/)

#### Gradle

- [Dbpatch Gradle Plugin](https://github.com/m-szalik/dbpatch/blob/master/how-to-use-example/with-gradle/build.gradle)
- [Flyway Gradle Plugin](https://flywaydb.org/documentation/gradle/) (before was [gradle-flyway-plugin](https://github.com/ben-manes/gradle-flyway-plugin))
- [Liquibase Gradle Plugin](https://github.com/liquibase/liquibase-gradle-plugin)

#### Grails

- [dbmigrate with Grails](https://code.google.com/archive/p/dbmigrate/wikis/Grails.wiki)
- [grails-flyway-plugin](https://github.com/daniel-lima/grails-flyway-plugin)
- [GFlyway2](https://github.com/Vav1lon/GFlyway2): Flyway 2 plugin for Grails
    - [Grails Flyway 2 Plugin](https://grails.org/plugin/gflyway2)
- [grails-flyway](https://github.com/saw303/grails-flyway): provides Flyway support for Grails 3 applications
    - [Using Grails 3 Flyway Plugin for database migrations](https://www.wangler.io/blog/2016/grails-flyway-plugin.html)
- [Database Migration Grails Plugin](http://grails-plugins.github.io/grails-database-migration/1.4.0/) uses the Liquibase library
- [Grails Database Migration Plugin](http://grails.org/plugin/database-migration)
- [Autobase Grails Plugin](https://grails.org/plugin/autobase)

### Clojure

- [Ragtime](https://github.com/weavejester/ragtime)
- [Lobos](https://github.com/budu/lobos)

### Go

- [dbmigrate](https://github.com/tanel/dbmigrate)
- [gomigrate](https://github.com/DavidHuie/gomigrate)
- [sql-migrate](https://github.com/rubenv/sql-migrate)
- [migration](https://github.com/BurntSushi/migration)
- [migrate](https://github.com/mattes/migrate)
- [goose](https://bitbucket.org/liamstask/goose)

## Articles

- [Managing Your DB Changes](http://www.tikalk.com/managing-your-db-changes/)
- [SSW Rules to Better SQL Server Databases](https://www.ssw.com.au/ssw/Standards/Rules/RulesToBetterSQLServerDatabases.aspx)
- [Gradual deployment of schema changes](http://nothing.tmtm.com/2009/02/gradual-deployment-of-schema-changes/)
- [Bulletproof Sql Change Scripts Using INFORMATION_SCHEMA Views](http://haacked.com/archive/2006/07/05/bulletproofsqlchangescriptsusinginformation_schemaviews.aspx/)
- [Future-Proof Your Database Change Log](http://robertelwell.info/blog/future-proof-db-changelog/)
- [Database Migrations And Java](https://techblog.bozho.net/database-migrations-and-java/)
- [Database version control](https://inviqa.com/blog/database-version-control)
- [Database Migration – What is it and why is it important?](http://www.iheavy.com/2011/06/15/database-migration-what-is-it-and-why-is-it-important/)
- [Database Version Control: Sooner than later!](http://diethardsteiner.blogspot.co.uk/2012/11/database-version-control-soon-than.html)
- [Database Migrations Done Right](http://www.brunton-spall.co.uk/post/2014/05/06/database-migrations-done-right/)
- [Patterns and Tools for Database Versioning, Migration, Data Loading and Test Data](http://www.slideshare.net/apinstein/patterns-and-tools-for-database-versioning-migration-data-loading-and-test-data)
- [Database Versioning and Delivery with Upgrade Scripts](https://www.infoq.com/articles/db-versioning-scripts)
- [The Definitive Guide to Database Version Control](https://www.infoq.com/articles/Database-Version-Control)
- Database Delivery Best Practices:
    - [Database versioning best practices](http://enterprisecraftsmanship.com/2015/08/10/database-versioning-best-practices/)
    - [State vs migration-driven database delivery](http://enterprisecraftsmanship.com/2015/08/18/state-vs-migration-driven-database-delivery/)
    - [Database versioning tools](http://enterprisecraftsmanship.com/2015/08/26/database-versioning-tools/)
- Matthew Skelton @ Simple Talk
    - [Better Ways to Build a Database](https://www.simple-talk.com/sql/database-delivery/better-ways-to-build-a-database/): The purpose of a database build is simple: prove that what you have in version control can successfully create a working database. And yet many teams struggle with unreliable and untested database build processes that slow down deployments and prevent the delivery of new functionality.
    - [Database Continuous Integration](https://www.simple-talk.com/sql/database-delivery/database-continuous-integration/)
    - [Using Migration Scripts in Database Deployments](https://www.simple-talk.com/sql/database-administration/using-migration-scripts-in-database-deployments/): Whereas a build script creates a database, a migration script, or ‘change’ script, alters a database. It is called a migration script because it changes all or part of a database from one version to another. It 'migrates' it between versions.
    - [Database Migrations: Modifying Existing Databases](https://www.simple-talk.com/sql/database-delivery/database-migrations-modifying-existing-databases/)
    - [Database Version Control](https://www.simple-talk.com/sql/database-delivery/database-version-control/)
    - [Database Branching and Merging Strategies](https://www.simple-talk.com/sql/database-administration/database-branching-and-merging-strategies/)

### Comparison

- [Continuous database migration with Liquibase and Flyway](http://www.h-online.com/developer/features/Continuous-database-migration-with-Liquibase-and-Flyway-1860080.html)
- [The comparison between flyway and liquibase](https://graphofknowledge.appspot.com/similartech/liquibase&flyway)
- [Liquibase vs Flyway which one to use?](http://stackoverflow.com/questions/37385823/liquibase-vs-flyway-which-one-to-use/37411404#37411404)
- [Flyway and liquibase together?](http://stackoverflow.com/questions/39044851/flyway-and-liquibase-together/39052447#39052447)
- [Liquibase & Flyway](http://www.slideshare.net/asolntsev/liquibase-flyway-baltic-devops)
- [How to manage incremental database changes, Liquibase vs Flyway](http://blog.getsandbox.com/2014/07/20/how-to-manage-database-change/)
- [Comparison between Flyway and Liquibase](http://techieindescribable.blogspot.co.uk/2013/08/comparison-between-flyway-and-liquibase.html)
- [Database Installer - Liquibase Vs Flyway](http://lifetechnology-narin.blogspot.co.uk/2012/08/database-installer-liquibase-vs-flyway.html)
- [Running Database Migrations for Java Apps](https://devcenter.heroku.com/articles/running-database-migrations-for-java-apps)
- [Continuous database migration with Liquibase and Flyway](http://www.h-online.com/developer/features/Continuous-database-migration-with-Liquibase-and-Flyway-1860080.html)
