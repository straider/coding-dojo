coding-dojo / Builders / Maven / Repository Managers
====================================================

Dojo to research and learn how to install and use Maven Repository Managers.

----

# 1. Introduction

## 1.1. Goals & Objectives

> A [repository manager](https://maven.apache.org/repository-management.html) is a dedicated server application designed to manage repositories of binary components. The usage of a repository manager is considered an essential best practice for any significant usage of Maven.

> A repository manager serves these essential purposes:
- act as dedicated proxy server for public Maven repositories;
- provide repositories as a deployment destination for your Maven project outputs.

## 1.2. Audience

This dojo is suitable to any programmer that wants to learn how install, configure and use Maven Repository Managers.

## 1.3. History

## 1.4. Limitations

## 1.5. Features

> Using a repository manager provides the following benefits and features:
- significantly reduced number of downloads off remote repositories, saving time and bandwidth resulting in increased build performance;
- improved build stability due to reduced reliance on external repositories;
- increased performance for interaction with remote SNAPSHOT repositories;
- potential for control of consumed and provided artifacts;
- creates a central storage and access to artifacts and meta data about them exposing build outputs to consumer such as other projects and developers, but also QA or operations teams or even customers;
- provides an effective platform for exchanging binary artifacts within your organization and beyond without the need for building artifact from source

----

# 2. Installation

## 2.1. Archiva

> Apache [Archiva](https://archiva.apache.org) is an extensible repository management software that helps taking care of your own personal or enterprise-wide build artifact repository. It is the perfect companion for build tools such as Maven, Continuum, and ANT.

> Archiva offers several capabilities, amongst which remote repository proxying, security access management, build artifact storage, delivery, browsing, indexing and usage reporting, extensible scanning functionality... and many more!

> Archiva is distributed under the [Apache License, version 2.0](http://www.apache.org/licenses/).

- [Download](https://archiva.apache.org/download.cgi) latest version of Archiva;
- Deploy the WAR file on the Servlet Container ( either Tomcat or Jetty, usually ):
  - Uncompress the content of the WAR file into webapps/archiva/;
  - Add the context.xml file to webapps/archiva/META-INF/;
  - Add the missing libraries to lib/ folder:
      - [activation-1.1.1.jar](http://repo1.maven.org/maven2/javax/activation/activation/1.1.1/activation-1.1.1.jar)
      - [mail-1.4.7.jar](http://repo1.maven.org/maven2/javax/mail/mail/1.4.7/mail-1.4.7.jar)
      - [derby-10.11.1.1.jar](http://repo1.maven.org/maven2/org/apache/derby/derby/10.11.1.1/derby-10.11.1.1.jar)
      - [derbytools-10.11.1.1.jar](http://repo1.maven.org/maven2/org/apache/derby/derbytools/10.11.1.1/derbytools-10.11.1.1.jar)

```xml
<?xml version = "1.0" encoding = "UTF-8"?>
<Context path = "/archiva">
	<Resource name            = "jdbc/archiva" 
	          auth            = "Container" 
			  type            = "javax.sql.DataSource"
		      username        = "sa"
		      password        = ""
		      driverClassName = "org.apache.derby.jdbc.EmbeddedDriver"
		      url             = "jdbc:derby:databases/archiva;create=true" 
	/>

	<Resource name            = "jdbc/users" 
	          auth            = "Container" 
			  type            = "javax.sql.DataSource"
		      username        = "sa"
		      password        = ""
		      driverClassName = "org.apache.derby.jdbc.EmbeddedDriver"
		      url             = "jdbc:derby:databases/users;create=true" 
	/>

	<Resource name           = "mail/Session" 
	          auth           = "Container"
			  type           = "javax.mail.Session"
			  mail.smtp.host = "localhost"
	/>
</Context>
```

There are 3 different types of files to download: WAR, sources and binaries:
- The binary version is a standalone version that includes Jetty and can act as a Linux or Windows service;
- The WAR version allows Archiva to deployed as a web application into any Java Servlet Container ( or Java Enterprise Application Server ).

**Note**: is a best practice to separate the base from the installation since it will allow easier upgrades to Archiva.

## 2.2. Artifactory

> As the first Binary Repository Management solution, [Artifactory](http://www.jfrog.com/artifactory/) has changed the way binaries are controlled, stored and managed throughout the software release cycle.

> Artifactory remedies the issues faced by software developers and DevOps teams, allowing them to manage, host and control the flow of binary artifacts from development to production.

Artifactory is more than just a Maven Repository Manager since it offers many more [features](http://www.jfrog.com/artifactory/features/) such as dealing with [Ruby gems](http://www.jfrog.com/artifactory/features/#addon-gems), [Python wheels](http://www.jfrog.com/artifactory/features/#addon-pypi) and [NuGet packages](http://www.jfrog.com/artifactory/features/#addon-nuget). Coupled with [Bintray](http://www.jfrog.com/bintray/) it can also handle a full software development life cycle with a delivery pipeline.

> What is a [Binary Repository Manager](http://www.jfrog.com/binary-repository/)?
>> It's a single gateway through which you access external artifacts, and store your own build artifacts. By centralizing the management of all binary artifacts, it overcomes the complexity arising from the diversity of binary types, their position in the workflow and the dependencies between them.

- [Download](https://sourceforge.net/projects/artifactory/files/artifactory/) latest version of Artifactory;
- Deploy the WAR file on the Servlet Container ( either Tomcat or Jetty, usually );

**Note**: The ZIP file also bundles a standalone version, on top of Tomcat.

**Attention**: Artifactory is heavy - it requires 512 MB minimum while recommending 2 GB for normal use.

## 2.3. Nexus 

> [Nexus](http://www.sonatype.org/nexus/) manages software components required for development, deployment, and provisioning. If you develop software, Nexus can help you share those components with other developers and end users. Nexus greatly simplifies the maintenance of your own internal repositories and access to external repositories. With Nexus you can completely control access to, and deployment of, every component in your organization from a single location.

> The basis of all Nexus versions is formed by Nexus OSS. It is licensed under the Eclipse Public License version 1.0 and can be used to get started with component and repository management. It provides a plugin infrastructure for all its features and supports numerous repository formats out of the box.

**Note**: Nexus runs within Jetty and it is started with a native service wrapper called the [Tanuki Java Service Wrapper](http://wrapper.tanukisoftware.com/doc/english/introduction.html). This service wrapper can be configured to run Nexus as a Windows service or a Unix daemon.

[Getting Started with Maven Repository Management](https://dzone.com/refcardz/getting-started-repository), by Jason van Zyl: Begin learning about Maven Repository Management, covering proxy repositories, hosted repositories, and repository groups.

**Attention**: latest versions of Nexus OSS run in standalone mode and there's no easy way to deploy a WAR file into a servlet container such as Tomcat or Jetty.

- [Download](http://www.sonatype.org/nexus/go/) latest version of Nexus OSS;
- Extract the content to a folder;
- Open a Command Prompt on the bin/ sub-folder and issue the following commands:

```bash
nexus install
nexus start
```

The standalone server will start on port 8081: http://localhost:8081/nexus.

----

# 3. Evaluation

Of the 3 repository managers there's just one simple and yet suitable solution: Archiva.

## 3.1. Archiva

### 3.1.1. Pros

- Runs in standalone mode, on top of Jetty;
- Can be deployed into a Servlet Container or Java Enterprise Application Server;
- Doesn't require much memory.

### 3.1.2. Cons

- The User Interface is not as rich as the others;
- It's just a Repository Manager, focused on Java libraries ( Maven ).

## 3.2. Artifactory


### 3.1.1. Pros

- Runs in standalone mode, on top of Tomcat;
- Can be deployed into a Servlet Container or Java Enterprise Application Server;
- The User Interface is rich;
- It's more than just a Repository Manager: can deal with gems and wheels.

### 3.1.2. Cons

- Requires plenty of memory.

## 3.3. Nexus OSS

### 3.1.1. Pros

- Runs in standalone mode, on top of Jetty;
- The User Interface is rich;
- It's more than just a Repository Manager: can deal with gems and wheels.

### 3.1.2. Cons

- There's no official WAR to deploy into a Servlet Container or Java Enterprise Application Server.

----

# 4. Milestones

## 4.1. Create Releases Repository

## 4.2. Create Snapshot Repository

## 4.3. Upload Libraries

## 4.4. Configure Network Proxy

## 4.5. Link to External Repository
