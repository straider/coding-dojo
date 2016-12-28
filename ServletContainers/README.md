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

> [JavaServer Pages](https://en.wikipedia.org/wiki/JavaServer_Pages) (JSP) is a technology that helps software developers create dynamically generated web pages based on HTML, XML, or other document types. JSP is similar to PHP, but it uses the Java programming language. To deploy and run JavaServer Pages, a compatible web server with a servlet container.

> The JavaServer Pages Standard Tag Library (JSTL) it extends the JSP specification by adding a tag library of JSP tags for common tasks, such as XML data processing, conditional execution, database access, loops and internationalization.

> The expression language started out as part of the JSTL and was originally called SPEL (Simplest Possible Expression Language), then just Expression Language (EL). It was a scripting language which allowed access to Java components (JavaBeans) through JSP. Over the years, the expression language has evolved to include more advanced functionality and it was included in the JSP 2.0 specification. Scripting was made easier for web-content designers who have little or practically no knowledge of the core Java Language. This scripting language made JSP a scripting language in the true sense.

## 1.1. Goal and Objectives

- To understand what is a Servlet Container;
- To understand the concept of Java Servlet;
- To learn how to install and do minimal configurations to Servlet Containers;

## 1.2. Audience

## 1.3. Scope

## 1.4. History

| Version | Release  | JavaEE | Notes  |
|---------|----------|--------|--------|
| 4.0     |          | 8      | HTTP/2 |
| 3.1     | May 2013 | 7      | Non-blocking I/O, HTTP protocol upgrade mechanism (WebSocket) |
| 3.0     | Dec 2009 | 6      | Pluggability, Ease of development, Async Servlet, Security, File Uploading |
| 2.5     | Sep 2005 | 5      | Requires Java SE 5, supports annotation |
| 2.4     | Nov 2003 | 1.4    | web.xml uses XML Schema |
| 2.3     | Aug 2001 | 1.3    | Addition of Filter |
| 2.2     | Aug 1999 | 1.2    | Becomes part of J2EE, introduced independent web applications in .war files |
| 2.1     | Nov 1998 |        | First official specification, added RequestDispatcher, ServletContext |
| 2.0     |          | 1.1    | Part of Java Servlet Development Kit 2.0 |
| 1.0     | Jun 1997 |        |        |

----

# 2. Servlet Containers

- [Tomcat](Tomcat/README.md)
- [Jetty](Jetty/README.md)

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
