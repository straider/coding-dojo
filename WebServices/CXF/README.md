:: Dojo :: Java :: WebServices :: CXF ::
========================================

----

# 1. Introduction

[Apache CXF](http://cxf.apache.org/) is an open-source fully feature WebServices framework that implements JAX-WS and JAX-RS APIs. The name CXF is the derived from the concatenation of [Celtix](http://celtix.ow2.org/) and [XFire](http://xfire.codehaus.org/).

> CXF supports a variety of _frontend_ programming models, for JAX-WS and JAX-RS. CXF supports both contract first development with WSDL and code first development from Java.

## 1.1. Goal & Objectives

The objective of this dojo is to give an introduction to CXF framework through several small and simple coding exercises.

**Note**: although being a simple dojo it is assumed that programmers know how to work with Ant or Maven or Gradle and have full access to a Java Application Server, such as GlassFish.

## 1.2. Audience

This dojo is aimed for programmers that know Java but have not yet had used CXF.

## 1.3. History

----

# 2. Resources

## 2.1. Tutorials

- [Creating JAX-RS web service using Apache CXF Example](https://examples.javacodegeeks.com/enterprise-java/rest/creating-jax-rs-web-service-using-apache-cxf/)
- [Apache CXF to create rest web service](https://sushantworld.wordpress.com/2011/01/23/apache-cxf-restful-web-service/)
- [Developing RESTful Services using Apache CXF](http://weblog4j.com/2012/03/15/developing-restful-services-using-apache-cxf/)
- [Developing SOAP Web service using Apache CXF](http://weblog4j.com/2012/05/01/developing-soap-web-service-using-apache-cxf/)
- [Simple JAX-RS Web Service in Java with Spring and CXF](http://www.dreamsyssoft.com/blog/blog.php?/archives/7-Simple-REST-Web-Service-in-Java-with-Spring-and-CXF.html)
- [REST Web Service Using CXF - Beginner's Tutorial](https://dzone.com/articles/rest-web-service-using-cxf)
- [Basic REST service in Apache CXF vs. Camel-CXF](https://dzone.com/articles/basic-rest-service-apache-cxf)
- [Recipe: Unit testing Apache CXF RESTful services](https://niftybits.wordpress.com/2009/08/26/recipe-unit-testing-apache-cxf-restful-services/)
- [Testing the JAX-RS RESTful Web Service](http://webstar.company/2014/02/testing-the-jax-rs-restful-web-service-2/)
- Develop a simple RESTful Webservices using Apache CXF and Spring Framework:
    - [Part 1](https://idodevjobs.wordpress.com/2014/08/30/develop-a-simple-restful-webservices-using-apache-cxf-and-spring-framework/)
    - [Part 2](https://idodevjobs.wordpress.com/2014/09/25/develop-a-simple-restful-webservices-using-apache-cxf-and-spring-framework-part-ii/)
    - [Part 3](https://idodevjobs.wordpress.com/2014/10/10/develop-a-simple-restful-webservices-using-apache-cxf-and-spring-framework-part-iii-exceptionerror-handling-using-exceptionmapper/)
    - [Part 4](https://idodevjobs.wordpress.com/2015/04/04/develop-a-simple-restful-webservices-using-apache-cxf-and-spring-framework-part-iv-jax-rs-beanparam-example/)

## 2.2. Articles

----

# 3. Milestones

When possible one of the two [CXF Maven Archetypes](https://mvnrepository.com/artifact/org.apache.cxf/cxf-archetypes) should be used:
- [Apache CXF Archetype JAX-WS](https://mvnrepository.com/artifact/org.apache.cxf.archetype/cxf-jaxws-javafirst) - Java First
- [Apache CXF Archetype JAX-RS](https://mvnrepository.com/artifact/org.apache.cxf.archetype/cxf-jaxrs-service)

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

- http://cxf.apache.org/docs/springboot.html
- https://blog.codecentric.de/en/2016/02/spring-boot-apache-cxf/
- http://chiragsdiary.blogspot.co.uk/2013/02/cxf-webservice-example-step-by-step.html
- http://www.ctrl-alt-dev.nl/Articles/CXF-Maven/CXF-Maven.html
- http://rerun.me/2013/09/01/building-cxf-rest-service-in-osgi-for-karaf/
- https://github.com/cschneider/Karaf-Tutorial
- http://cxf.apache.org/dosgi-apache-karaf-feature.html

## 3.1. Hello World

- Given a WSDL code the server side and the client side of a simple service that always responds with "Hello, World!" to any request;
- Without a WSDL code the server side and the client side of the same service and produce a similar WSDL;
- Change both versions to produce a data response in XML format and in JSON format;
- Compare both approaches: WSDL first or Java first;
- Code the server side and the client side of a similar service using GET method;
- Compare both APIs: SOAP and REST.

## 3.2. Hello Someone

- Given a WSDL code the server side and the client side of a simple service that responds with "Hello, World!" or "Hello, [SOMEONE]!" in XML or JSON format to a request with a parameter, name, which by default is "World";
- Without a WSDL code the server side and the client side of the same service and produce a similar WSDL;
- Compare both approaches: WSDL first or Java first;
- Code the server side and the client side of a similar service using GET method, that handles a query parameter, name;
- Compare both APIs: SOAP and REST.

## 3.3. Checksum

## 3.4. Checksum Multiple Algorithm

## 3.5. Checksum Multiple Values

----

# 4. TDD - Test-Driven Development

