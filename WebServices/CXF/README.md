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

- [Apache CXF](http://cxf.apache.org/)
- [Apache CXF](https://github.com/apache/cxf) @ GitHub
- [Apache CXF](https://en.wikipedia.org/wiki/Apache_CXF) @ Wikipedia

## 2.1. Tutorials

### 2.1.1. REST

- [Developing RESTful Services using Apache CXF](http://weblog4j.com/2012/03/15/developing-restful-services-using-apache-cxf/)
- [Creating JAX-RS web service using Apache CXF Example](https://examples.javacodegeeks.com/enterprise-java/rest/creating-jax-rs-web-service-using-apache-cxf/)
- [Developing RESTful Services using Apache CXF](https://www.javacodegeeks.com/2013/07/developing-restful-services-using-apache-cxf.html)
- [REST Web Service Using CXF - Beginner's Tutorial](https://dzone.com/articles/rest-web-service-using-cxf)
- [Basic REST service in Apache CXF vs. Camel-CXF](https://dzone.com/articles/basic-rest-service-apache-cxf)
- [Apache CXF to create rest web service](https://sushantworld.wordpress.com/2011/01/23/apache-cxf-restful-web-service/)
- Develop a simple RESTful Webservices using Apache CXF and Spring Framework:
    - [Part 1](https://idodevjobs.wordpress.com/2014/08/30/develop-a-simple-restful-webservices-using-apache-cxf-and-spring-framework/)
    - [Part 2](https://idodevjobs.wordpress.com/2014/09/25/develop-a-simple-restful-webservices-using-apache-cxf-and-spring-framework-part-ii/)
    - [Part 3](https://idodevjobs.wordpress.com/2014/10/10/develop-a-simple-restful-webservices-using-apache-cxf-and-spring-framework-part-iii-exceptionerror-handling-using-exceptionmapper/)
    - [Part 4](https://idodevjobs.wordpress.com/2015/04/04/develop-a-simple-restful-webservices-using-apache-cxf-and-spring-framework-part-iv-jax-rs-beanparam-example)
- [Simple JAX-RS Web Service in Java with Spring and CXF](http://www.dreamsyssoft.com/blog/blog.php?/archives/7-Simple-REST-Web-Service-in-Java-with-Spring-and-CXF.html)
- [Restful WebService using CXF](http://www.learninjava.com/pages/restful-webservice-using-cxf.php)
- [Recipe: Unit testing Apache CXF RESTful services](https://niftybits.wordpress.com/2009/08/26/recipe-unit-testing-apache-cxf-restful-services/)
- [Testing the JAX-RS RESTful Web Service](http://webstar.company/2014/02/testing-the-jax-rs-restful-web-service-2/)

### 2.1.2. SOAP

- [Developing SOAP Web service using Apache CXF](http://weblog4j.com/2012/05/01/developing-soap-web-service-using-apache-cxf/)
- [Developing a Service](http://cxf.apache.org/docs/developing-a-service.html)
- [Developing a Consumer](http://cxf.apache.org/docs/developing-a-consumer.html)
- [Writing a service with Spring](http://cxf.apache.org/docs/writing-a-service-with-spring.html)
- [Spring Boot & Apache CXF – How to SOAP in 2016](https://blog.codecentric.de/en/2016/02/spring-boot-apache-cxf/)
- Roy Tutorials: CXF + Spring + Maven
    - [Create SOAP Webservice using Apache CXF, Spring, Maven](http://www.roytuts.com/create-soap-webservice-using-apache-cxf-spring-maven/)
    - [Consume SOAP Webservice using Apache CXF, Spring, Maven](http://www.roytuts.com/consume-soap-webservice-using-apache-cxf-spring-maven/)
- [Developing Web services using Apache CXF and Maven](http://www.ctrl-alt-dev.nl/Articles/CXF-Maven/CXF-Maven.html)
- [Developing SOAP Web service using Apache CXF](https://www.javacodegeeks.com/2013/06/developing-soap-web-service-using-apache-cxf.html)
- [Apache CXF – JAX-WS – Simple Tutorial](https://alvinjayreyes.com/2013/05/05/apache-cxf-jax-ws-simple-tutorial/)
- [How to create a WSDL-first SOAP client in Java with CXF and Maven](http://www.logicsector.com/java/how-to-create-a-wsdl-first-soap-client-in-java-with-cxf-and-maven/)
- [Creating a WSDL-first web service with Apache CXF or GlassFish Metro](https://web-gmazza.rhcloud.com/blog/entry/web-service-tutorial)
- [Creating a Java-first web service using CXF or Metro](http://web-gmazza.rhcloud.com/blog/entry/java-first-web-service)
- [Creating a SOAP client with either Apache CXF or GlassFish Metro](http://web-gmazza.rhcloud.com/blog/entry/soap-client-tutorial)

## 2.2. Articles

## 2.3. Tools

- [Java to WS](http://cxf.apache.org/docs/java-to-ws.html)
- [WSDL to Java](http://cxf.apache.org/docs/wsdl-to-java.html)
- [WSDL Validator](http://cxf.apache.org/docs/wsdlvalidator.html)
- [XSD to WSDL](http://cxf.apache.org/docs/xsd-to-wsdl.html)
- [WSDL to SOAP](http://cxf.apache.org/docs/wsdl-to-soap.html)

### 2.3.1. Maven Plugins

- [Maven POM Information](http://cxf.apache.org/docs/using-cxf-with-maven.html)
- [CXF Maven Archetypes](https://github.com/apache/cxf/tree/master/maven-plugins/archetypes)
- [java2wadl Maven plugin](http://cxf.apache.org/docs/jaxrs-services-description.html#JAXRSServicesDescription-java2wadlMavenplugin)
- [cxf-codegen-plugin](http://cxf.apache.org/docs/maven-cxf-codegen-plugin-wsdl-to-java.html)
- [cxf-java2ws-plugin](http://cxf.apache.org/docs/maven-java2ws-plugin.html)
- [cxf-xjc-plugin](http://cxf.apache.org/cxf-xjc-plugin.html)

### 2.3.2. Gradle Plugins

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

## 3.6. ToDo

----

# 4. TDD - Test-Driven Development
