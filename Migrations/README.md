:: SQL :: Migrations ::
=======================

# Overview

## Scope

## Audience

# Resources

- [Evolutionary Database Design](http://martinfowler.com/articles/evodb.html)
- [Three Rules for Database Work](http://odetocode.com/blogs/scott/archive/2008/01/30/three-rules-for-database-work.aspx)
- [Is Your Database Under Version Control?](https://blog.codinghorror.com/is-your-database-under-version-control/)
- [SSW Rules to Better SQL Server Databases](https://www.ssw.com.au/ssw/Standards/Rules/RulesToBetterSQLServerDatabases.aspx)
- [Database Version Control: Sooner than later!](http://diethardsteiner.blogspot.co.uk/2012/11/database-version-control-soon-than.html)

## Tools

- [Migrator: ActiveRecord Migrations in Java](http://www.jroller.com/obie/entry/migrator_activerecord_migrations_in_java)
- [migrate4j](http://migrate4j.sourceforge.net/)
- [DbMaintain](http://www.dbmaintain.org/overview.html)
- [dbmigrate](https://code.google.com/archive/p/dbmigrate/)
- [Dbpatch](https://github.com/m-szalik/dbpatch): Manage versioning of your databases with maven, gradle or standalone GUI application
- [dbdeploy](http://dbdeploy.com/)
    - [dbdeploy](https://code.google.com/archive/p/dbdeploy/)
    - [database schema evolution versus schema versioning](https://oschmi.blogspot.co.uk/2012/02/database-schema-evolution-versus-schema.html)
- [dbv](https://dbv.vizuina.com/)
    - [dbv](https://github.com/victorstanciu/dbv): Database version control, made easy!
- [Flyway](https://flywaydb.org/)
    - [Lessons Learned Using Flyway DB with Distributed Version Control](http://www.jeremyjarrell.com/using-flyway-db-with-distributed-version-control/)
    - [Easy Database Migrations using Flyway, Java EE 6 and GlassFish](http://www.hascode.com/2013/04/easy-database-migrations-using-flyway-java-ee-6-and-glassfish/)
    - [Ant Tasks](https://flywaydb.org/documentation/ant/) are provided as an AntLib
- [Liquibase](http://www.liquibase.org/)
    - [Liquibase](https://github.com/liquibase)
    - [groovy-liquibase](https://github.com/tlberglund/groovy-liquibase): Yet Another Groovy DSL for Liquibase
    - [liquibase-groovy-dsl](https://github.com/liquibase/liquibase-groovy-dsl): official Groovy DSL for Liquibase
    - [Agile database migrations with Liquibase: How I learned to love my inner DBA](http://techbeacon.com/agile-database-migrations-liquibase-how-i-learned-love-my-inner-dba)

### Maven

- [Maven Plugin](https://flywaydb.org/documentation/maven/)

### Gradle

- [Gradle Plugin](https://flywaydb.org/documentation/gradle/) (before was [gradle-flyway-plugin](https://github.com/ben-manes/gradle-flyway-plugin))

### Grails

- [dbmigrate with Grails](https://code.google.com/archive/p/dbmigrate/wikis/Grails.wiki)
- [Grails Flyway 2 Plugin](https://grails.org/plugin/gflyway2)
- [grails-flyway](https://github.com/saw303/grails-flyway)
    - [Using Grails 3 Flyway Plugin for database migrations](https://www.wangler.io/blog/2016/grails-flyway-plugin.html)
- [Database Migration Grails Plugin](http://grails-plugins.github.io/grails-database-migration/1.4.0/) uses the Liquibase library
- [Grails Database Migration Plugin](http://grails.org/plugin/database-migration)
- [Autobase Grails Plugin](https://grails.org/plugin/autobase)

## Articles

- [Managing Your DB Changes](http://www.tikalk.com/managing-your-db-changes/)

### Comparison

- [Continuous database migration with Liquibase and Flyway](http://www.h-online.com/developer/features/Continuous-database-migration-with-Liquibase-and-Flyway-1860080.html)
- [The comparison between flyway and liquibase](https://graphofknowledge.appspot.com/similartech/liquibase&flyway)
- [Liquibase vs Flyway which one to use?](http://stackoverflow.com/questions/37385823/liquibase-vs-flyway-which-one-to-use/37411404#37411404)
- [Flyway and liquibase together?](http://stackoverflow.com/questions/39044851/flyway-and-liquibase-together/39052447#39052447)
- [Liquibase & Flyway](http://www.slideshare.net/asolntsev/liquibase-flyway-baltic-devops)
- [How to manage incremental database changes, Liquibase vs Flyway](http://blog.getsandbox.com/2014/07/20/how-to-manage-database-change/)
- [Comparison between Flyway and Liquibase](http://techieindescribable.blogspot.co.uk/2013/08/comparison-between-flyway-and-liquibase.html)
- [Database Installer - Liquibase Vs Flyway](http://lifetechnology-narin.blogspot.co.uk/2012/08/database-installer-liquibase-vs-flyway.html)
