:: Java :: WebServices :: Spring MVC ::
=======================================

----

# 1. Introduction

## 1.1. Goal & Objectives

The objective of this dojo is to give an introduction to Spring MVC through several small and simple coding exercises.

**Note**: although being a simple dojo it is assumed that programmers know how to work with Ant or Maven or Gradle and have full access to a Servlet Container, such as Tomcat or Jetty.

## 1.2. Audience

This dojo is aimed for programmers that know Java but have not yet had used Spring MVC.

## 1.3. History

----

# 2. Resources

## 2.1. Tutorials

## 2.2. Articles

----

# 3. Milestones

Each milestone requires a Web Container. Which may be a Servlet Container, an [OSGi](https://www.osgi.org/developer/specifications/) Container or an Application Server, such as GlassFish or Wildfly:
- Servlet Containers:
  - [Tomcat](http://tomcat.apache.org/)
  - [Jetty](http://www.eclipse.org/jetty/)
  - [Undertow](http://undertow.io/)
  - [Spring Boot](http://projects.spring.io/spring-boot/)
  - [Bootique](http://bootique.io/)
- OSGi Containers:
  - [Felix](http://felix.apache.org/)
  - [Equinox](http://www.eclipse.org/equinox/)
  - [Knopflerfish](http://www.knopflerfish.org/)
  - [Karaf](http://karaf.apache.org/)

> What's the best ( simple, light, fast ) choice?

## 3.1. Hello World

- Given a WADL code the server side and the client side of a simple service that always responds with "Hello, World!" to any request;
- Without a WADL code the server side and the client side of the same service and produce a similar WADL;
- Change both versions to produce a data response in XML format and in JSON format;
- Compare both approaches: WADL first or Java first;
- Code the server side and the client side of a similar service using GET method;
- Compare both APIs: SOAP and REST.

## 3.2. Hello Someone

- Given a WADL code the server side and the client side of a simple service that responds with "Hello, World!" or "Hello, [SOMEONE]!" in XML or JSON format to a request with a parameter, name, which by default is "World";
- Without a WADL code the server side and the client side of the same service and produce a similar WADL;
- Compare both approaches: WADL first or Java first;
- Code the server side and the client side of a similar service using GET method, that handles a query parameter, name;
- Compare both APIs: SOAP and REST.

## 3.3. Checksum

## 3.4. Checksum Multiple Algorithm

## 3.5. Checksum Multiple Values

## 3.6. ToDo

----

# 4. TDD - Test-Driven Development
