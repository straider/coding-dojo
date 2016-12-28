Java / Servlet Containers / Tomcat
==================================

# Overview

[Apache Tomcat](http://tomcat.apache.org/) is an open source web server and servlet container that implements several Java EE specifications: Java Servlet, JavaServer Pages, Java Expression Language and Java WebSocket technologies. Apache Tomcat is developed in an open and participatory environment and released under the [Apache License version 2](http://www.apache.org/licenses/).

## Components

- **Catalina**: is Tomcat's servlet container. Catalina implements Sun Microsystems' specifications for servlet and JavaServer Pages (JSP). In Tomcat, a Realm element represents a "database" of usernames, passwords, and roles (similar to Unix groups) assigned to those users;
- **Coyote**: is a connector component for Tomcat that supports the HTTP 1.1 protocol as a web server. This allows Catalina, nominally a Java Servlet or JSP container, to also act as a plain web server that serves local files as HTTP documents;
- **Jasper**: is Tomcat's JSP Engine. Jasper parses JSP files to compile them into Java code as servlets, that can be handled by Catalina. At runtime, Jasper detects changes to JSP files and recompiles them;
- **Cluster**: this component has been added to manage large applications. It is used for load balancing that can be achieved through many techniques. Clustering support currently requires the JDK version 1.5 or later;
- **High availability**: a feature added to facilitate the scheduling of system upgrades (e.g. new releases, change requests) without affecting the live environment. This is done by dispatching live traffic requests to a temporary server on a different port while the main server is upgraded on the main port. It is very useful in handling user requests on high-traffic web applications;
- **Web application**: a feature that added user-based as well as system-based web applications enhancement, such as support for deployment across the variety of environments. It also tries to manage sessions as well as applications across the network.

**Note**: Another Coyote Connector, Coyote JK, also listens for incoming connections to the server on a specific TCP port but instead forwards its requests to another web server, such as Apache, using the JK protocol. This usually offers better performance.

## History

| Version | Release        | Servlet | Notes |
|---------|----------------|---------|-------|
| 8.0     | Jun 25th, 2014 | [Servlet 3.1](http://jcp.org/en/jsr/detail?id=340), [JSP 2.3, EL 2.3](http://jcp.org/en/jsr/detail?id=245) and WebSocket | |
| 7.0     | Jan 14th, 2011 | [Servlet 3.0, JSP 2.2, and EL 2.2](http://www.jcp.org/en/jsr/detail?id=315) | |
| 6.0     | Feb 28th, 2007 | [Servlet 2.5, JSP 2.1 and EL 2.1](http://www.jcp.org/en/jsr/detail?id=154) | |
| 5.0     | Dec 3rd, 2003  | [Servlet 2.4, JSP 2.0 and EL 1.1](http://www.jcp.org/en/jsr/detail?id=154) | |
| 4.1     | Sep 6th, 2002  | [Servlet 2.3 and JSP 1.2](http://www.jcp.org/en/jsr/detail?id=53) | |
| 3.0     | Initial release, in 1999 | Servlet 2.2 and JSP 1.1 | |

# Installation

- Download latest version;
- Extract;
- Edit configuration.

```bash
pushd $HOME/tmp

wget http://www.eu.apache.org/dist/tomcat/tomcat-8/v8.0.24/bin/apache-tomcat-8.0.24.tar.gz

tar -zxvf apache-tomcat-8.0.24.tar.gz -C $HOME/opt
rm -Rf apache-tomcat-8.0.24.tar.gz apache-tomcat-8.0.24/

mv $HOME/opt/apache-tomcat-8.0.24 $HOME/opt/tomcat-8.0.24
ln -sf $HOME/opt/tomcat-8.0.24 tomcat

export CATALINA_HOME=$HOME/opt/tomcat

popd
```

**Note**: it is possible, in Linux or in Windows, to use Tomcat server as a service.

The Tomcat configuration files are located in the conf/ sub-folder of [TOMCAT_FOLDER]. There are 4 main configuration files, in XML:
- **server.xml**: it's where the TCP port number is configured, which by default is set to 8080;
- **web.xml**: it's convenient to enable Directory Listing, by changing the default value of false to true for "listings" parameter;
- **context.xml**: it's convenient to enable Automatic Reload, by adding the attribute reloadable="true" to the ```<Context>``` element
- **tomcat-users.xml**: it's convenient to add a manager GUI user for managing Tomcat server through the web interface or to add a manager script user to allow control through HTTP protocol ( GET or PUT ).

```xml
<tomcat-users>
  <role rolename="manager-gui" />
  <role rolename="manager-script" />
  <role rolename="manager-jmx" />
  <role rolename="manager-gui" />
  <user username="admin"   password="****" roles="manager-gui" />
  <user username="manager" password="****" roles="manager-script" />
</tomcat-users>
```

The **start** and **stop** commands can be issued by executing the following commands:

```bash
export CATALINA_OPTS="-server -Xms512m -Xmx2048m -XX:MaxPermSize=512m"
$CATALINA_HOME/bin/startup.sh

$CATALINA_HOME/bin/shutdown.sh
```

# Tools

## Maven

- [Tomcat Maven Plugin](http://tomcat.apache.org/maven-plugin.html)

## Gradle

- [gradle-tomcat-plugin](https://github.com/bmuschko/gradle-tomcat-plugin)
- [Gretty](https://github.com/akhikhl/gretty)
