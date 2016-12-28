Java / Servlet Containers / Jetty
=================================

# Overview

[Jetty](http://www.eclipse.org/jetty/) provides a Web server and Servlet Container, plus support for SPDY, WebSocket, OSGi, JMX, JNDI, JAAS and many other integrations. Jetty can be easily embedded in devices, tools, frameworks, application servers, and clusters

Jetty server instances that configures the deploy module will have a web application deployer that hot deploys files found in the webapps directory.

## Components

The Jetty Server is the plumbing between a collection of Connectors that accept HTTP connections and a collection of Handlers that service requests from the connections and produce responses, with threads from a thread pool doing the work.

- **Connectors**: The connectors represent the protocol handlers that accept connections, parse requests and generate responses;
- **Handlers**: The handlers deal with received requests:
  - The ServletHandler is a Handler that generates content by passing the request to any configured filters and then to a Servlet mapped by a URI pattern;
  - Contexts are handlers that group other handlers below a particular URI context path or a virtual host. Contexts implementations include:
      - ContextHandler
      - Servlet Context
      - Web Application Context: is a derivation of the servlet Context that supports the standardized layout of a web application and configuration of session, security, listeners, filter, servlets, and JSP via a web.xml descriptor normally found in the WEB-INF directory.

## History

| Version | Release      | Servlet | Notes |
|---------|--------------|---------|-------|
| 9.2     | 2014         | Servlet 3.1 and JSP 2.3 | |
| 9.1     |              | Servlet 3.1 and JSP 2.3 | |
| 9.0     |              | Servlet 3.0 and JSP 2.2 | |
| 8.0     | 2009         | Servlet 3.0 and JSP 2.1 | |
| 7.0     | 2008         | Servlet 2.5 and JSP 2.1 | |
| 6.0     | 2006 to 2010 | Servlet 2.5 and JSP 2.0 | |
| 5.0     | 2003 to 2009 | Servlet 2.4 and JSP 2.0 | |
| 4.0     | 2001 to 2006 | Servlet 2.3 and JSP 1.2 | |
| 3.0     | 1999 to 2002 | Servlet 2.2 and JSP 1.1 | |
| 2.0     | 1998 to 2000 | Servlet 2.1 and JSP 1.0 | |
| 1.0     | 1995 to 1998 |                         | |

# Installation

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

# Tools

## Maven

- [Jetty Maven Plugin](http://www.eclipse.org/jetty/documentation/current/jetty-maven-plugin.html)

## Gradle

- [Jetty Plugin](https://docs.gradle.org/current/userguide/jetty_plugin.html)
- [Gretty](https://github.com/akhikhl/gretty)
