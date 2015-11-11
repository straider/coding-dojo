coding-dojo / Java / Servlet Containers
=======================================

----

# 1. Introduction

> A [Servlet Container](https://en.wikipedia.org/wiki/Web_container)  is the component of a web server that interacts with Java servlets. It is responsible for managing the lifecycle of servlets, mapping a URL to a particular servlet and ensuring that the URL requester has the correct access rights.

- [Apache Tomcat](http://tomcat.apache.org/) ( formerly known as Jakarta Tomcat );
- [Jetty](http://www.eclipse.org/jetty/), from the Eclipse Foundation;
- Resin Web Server, from [Caucho](http://caucho.com/);
- [Undertow](http://undertow.io/);
- [Winstone](http://winstone.sourceforge.net/);
- [Tiny Java Web Server](http://tjws.sourceforge.net/) ( TJWS );
- [Simple](http://www.simpleframework.org/).

> A Java servlet is a Java programming language program that extends the capabilities of a server. Although servlets can respond to any types of requests, they most commonly implement applications hosted on Web servers. Such Web servlets are the Java counterpart to other dynamic Web content technologies such as PHP and ASP.NET.

> JavaServer Pages (JSP) is a technology that helps software developers create dynamically generated web pages based on HTML, XML, or other document types. JSP is similar to PHP, but it uses the Java programming language. To deploy and run JavaServer Pages, a compatible web server with a servlet container.

> The JavaServer Pages Standard Tag Library (JSTL) it extends the JSP specification by adding a tag library of JSP tags for common tasks, such as XML data processing, conditional execution, database access, loops and internationalization.

> The expression language started out as part of the JSTL and was originally called SPEL (Simplest Possible Expression Language), then just Expression Language (EL). It was a scripting language which allowed access to Java components (JavaBeans) through JSP. Over the years, the expression language has evolved to include more advanced functionality and it was included in the JSP 2.0 specification. Scripting was made easier for web-content designers who have little or practically no knowledge of the core Java Language. This scripting language made JSP a scripting language in the true sense.

## 1.1. Goal and Objectives

- To understand what is a Servlet Container;
- To understand the concept of Java Servlet;
- To learn how to install and do minimal configurations to Servlet Containers;

## 1.2. Audience

## 1.3. Features

## 1.4. Constraints

----

# 2. Installation

## 2.1. Tomcat

Apache Tomcat is an open source web server and servlet container that implements several Java EE specifications: Java Servlet, JavaServer Pages, Java Expression Language and Java WebSocket technologies. Apache Tomcat is developed in an open and participatory environment and released under the [Apache License version 2](http://www.apache.org/licenses/).

### 2.1.1. Components

- **Catalina**: is Tomcat's servlet container. Catalina implements Sun Microsystems' specifications for servlet and JavaServer Pages (JSP). In Tomcat, a Realm element represents a "database" of usernames, passwords, and roles (similar to Unix groups) assigned to those users;
- **Coyote**: is a connector component for Tomcat that supports the HTTP 1.1 protocol as a web server. This allows Catalina, nominally a Java Servlet or JSP container, to also act as a plain web server that serves local files as HTTP documents;
- **Jasper**: is Tomcat's JSP Engine. Jasper parses JSP files to compile them into Java code as servlets, that can be handled by Catalina. At runtime, Jasper detects changes to JSP files and recompiles them;
- **Cluster**: this component has been added to manage large applications. It is used for load balancing that can be achieved through many techniques. Clustering support currently requires the JDK version 1.5 or later;
- **High availability**: a feature added to facilitate the scheduling of system upgrades (e.g. new releases, change requests) without affecting the live environment. This is done by dispatching live traffic requests to a temporary server on a different port while the main server is upgraded on the main port. It is very useful in handling user requests on high-traffic web applications;
- **Web application**: a feature that added user-based as well as system-based web applications enhancement, such as support for deployment across the variety of environments. It also tries to manage sessions as well as applications across the network.

**Note**: Another Coyote Connector, Coyote JK, also listens for incoming connections to the server on a specific TCP port but instead forwards its requests to another web server, such as Apache, using the JK protocol. This usually offers better performance.

### 2.1.2. History

- 8.0: Released on Jun 25th, 2014, implements [Servlet 3.1](http://jcp.org/en/jsr/detail?id=340), [JSP 2.3, EL 2.3](http://jcp.org/en/jsr/detail?id=245) and WebSocket specifications;
- 7.0: Released on Jan 14th, 2011, implements [Servlet 3.0, JSP 2.2, and EL 2.2](http://www.jcp.org/en/jsr/detail?id=315) specifications;
- 6.0: Released on Feb 28th, 2007, implements [Servlet 2.5, JSP 2.1 and EL 2.1](http://www.jcp.org/en/jsr/detail?id=154) specifications;
- 5.0: Released on Dec 3rd, 2003, implements [Servlet 2.4, JSP 2.0 and EL 1.1](http://www.jcp.org/en/jsr/detail?id=154) specifications;
- 4.1: Released on Sep 6th, 2002, implements [Servlet 2.3 and JSP 1.2](http://www.jcp.org/en/jsr/detail?id=53) specifications;
- 3.0: Initial release, in 1999, implements Servlet 2.2 and JSP 1.1 specifications.

### 2.1.3. Installation

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

## 2.2. Jetty

Jetty provides a Web server and Servlet Container, plus support for SPDY, WebSocket, OSGi, JMX, JNDI, JAAS and many other integrations. Jetty can be easily embedded in devices, tools, frameworks, application servers, and clusters

Jetty server instances that configures the deploy module will have a web application deployer that hot deploys files found in the webapps directory.

### 2.2.1. History

The Jetty Server is the plumbing between a collection of Connectors that accept HTTP connections and a collection of Handlers that service requests from the connections and produce responses, with threads from a thread pool doing the work.

- **Connectors**: The connectors represent the protocol handlers that accept connections, parse requests and generate responses;
- **Handlers**: The handlers deal with received requests:
  - The ServletHandler is a Handler that generates content by passing the request to any configured filters and then to a Servlet mapped by a URI pattern;
  - Contexts are handlers that group other handlers below a particular URI context path or a virtual host. Contexts implementations include:
      - ContextHandler
      - Servlet Context
      - Web Application Context: is a derivation of the servlet Context that supports the standardized layout of a web application and configuration of session, security, listeners, filter, servlets, and JSP via a web.xml descriptor normally found in the WEB-INF directory.

### 2.2.2. History

- 9.2: Released in 2014, implements Servlet 3.1 and JSP 2.3 specifications;
- 9.1: Implements Servlet 3.1 and JSP 2.3 specifications;
- 9.0: Implements Servlet 3.0 and JSP 2.2 specifications;
- 8.0: Released in 2009, implements Servlet 3.0 and JSP 2.1 specifications;
- 7.0: Released in 2008, implements Servlet 2.5 and JSP 2.1 specifications;
- 6.0: Released from 2006 to 2010, implements Servlet 2.5 and JSP 2.0 specifications;
- 5.0: Released from 2003 to 2009, implements Servlet 2.4 and JSP 2.0 specifications;
- 4.0: Released from 2001 to 2006, implements Servlet 2.3 and JSP 1.2 specifications;
- 3.0: Released from 1999 to 2002, implements Servlet 2.2 and JSP 1.1 specifications;
- 2.0: Released from 1998 to 2000, implements Servlet 2.1 and JSP 1.0 specifications;
- 1.0: Released from 1995 to 1998.

### 2.2.3. Installation

- Download latest version;
- Extract;
- Edit configuration.

```bash
pushd $HOME/tmp

wget http://download.eclipse.org/jetty/9.2.13.v20150730/dist/jetty-distribution-9.2.13.v20150730.tar.gz

tar -zxvf jetty-distribution-9.2.13.v20150730.tar.gz -C $HOME/opt
rm -Rf jetty-distribution-9.2.13.v20150730.tar.gz jetty-distribution-9.2.13.v20150730/

mv $HOME/opt/jetty-distribution-9.2.13.v20150730 $HOME/opt/jetty-9.2.13
ln -sf $HOME/opt/jetty-9.2.13 jetty

export JETTY_HOME=$HOME/opt/jetty

popd
```

**Note**: it is possible, in Linux or in Windows, to use Jetty server as a service.

The **start** and **stop** commands can be issued by executing the following commands:

```bash
java -jar $JETTY_HOME/start.jar --module=webapp jetty.port=8080

java -jar $JETTY_HOME/start.jar --stop
```

To check the configuration just issue the following command:

```bash
java -jar $JETTY_HOME/start.jar --module=webapp --list-config

java -jar $JETTY_HOME/start.jar --list-modules
```

----

# 3. Evaluation

## 3.1. Tomcat

### 3.1.1. Pros

### 3.1.2. Cons

## 3.2. Jetty

### 3.2.1. Pros

### 3.2.2. Cons

----

# 4. Milestones

## 4.1. Startup

- standalone
- as a service

## 4.2. Shutdown

- standalone
- as a service

## 4.3. Monitor

## 4.4. Configuration

- Use port other than 8080
- Create users, with different roles

## 4.5. Deploy

## 4.6. Extend - Libraries

- Add JDBC Drivers
- Add Log4J
- ...
