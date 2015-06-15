:: Dojo :: JAX-RS ::
====================

----

# 1. Introdução

> **JAX-RS** or _Java API for RESTful Web Services_ is a Java programming language API that provides support in creating web services according to the Representational State Transfer ( [REST](http://en.wikipedia.org/wiki/Representational_state_transfer) ) architectural pattern. JAX-RS uses annotations, introduced in Java SE 5, to simplify the development and deployment of web service clients and endpoints. From version 1.1 on, JAX-RS is an official part of Java EE 6.

> [Jersey](https://jersey.java.net/) is the reference implementation and the API is specified at [JAX-RS Specification](https://jax-rs-spec.java.net/).

## 1.1. Goal & Objetives

The objective of this dojo is to give an introduction to JAX-RS API through several small and simple coding exercises.

The goal on each milestone is to access a fully defined [WADL](https://jersey.java.net/documentation/latest/wadl.html). The content type can just be plain text but, optionally, it can also be XML or JSON. The deliverables on each milestone must include an **ApplicationWrapper** class that inherits from [Application](https://jax-rs-spec.java.net/nonav/2.0/apidocs/javax/ws/rs/core/Application.html) class.

By the end of the dojo the programmer should be able to understand and use the following [annotations](https://jersey.java.net/documentation/latest/jaxrs-resources.html#d0e2153):

- [@Path](https://jax-rs-spec.java.net/nonav/2.0/apidocs/javax/ws/rs/Path.html)
- [@PathParam](https://jax-rs-spec.java.net/nonav/2.0/apidocs/javax/ws/rs/PathParam.html)
- [@QueryParam](https://jax-rs-spec.java.net/nonav/2.0/apidocs/javax/ws/rs/QueryParam.html)
- [@DefaultValue](https://jax-rs-spec.java.net/nonav/2.0/apidocs/javax/ws/rs/DefaultValue.html)
- [@GET](https://jax-rs-spec.java.net/nonav/2.0/apidocs/javax/ws/rs/GET.html)
- [@POST](https://jax-rs-spec.java.net/nonav/2.0/apidocs/javax/ws/rs/POST.html)
- [@Produces](https://jax-rs-spec.java.net/nonav/2.0/apidocs/javax/ws/rs/Produces.html)
- [@Consumes](https://jax-rs-spec.java.net/nonav/2.0/apidocs/javax/ws/rs/Consumes.html)

**Note**: although being a simple dojo it is assumed that programmers know how to work with Ant or Maven or Gradle and have full access to a Java Application Server, such as GlassFish.

## 1.2. Audience

This dojo is aimed for programmers that know Java but have not yet had used JAX-RS API.

## 1.3. History

- JAX-RS 2.1: corresponds to [JSR 370](https://jcp.org/en/jsr/detail?id=370);
- JAX-RS 2.0: corresponds to [JSR 339](https://jcp.org/en/jsr/detail?id=339);
- JAX-RS 1.1: corresponds to [JSR 311](https://jcp.org/en/jsr/detail?id=311);
- JAX-RS 1.0: corresponds to [JSR 311](https://jcp.org/en/jsr/detail?id=311).

----

# 2. Milestones

There is a terminology that one must understand in to order to work with online addresses, in the formar ```<scheme name> : <hierarchical part> [ ? <query> ] [ # <fragment> ]```:

- [URI](http://en.wikipedia.org/wiki/Uniform_resource_identifier): Uniform Resource Identifier;
- [URN](http://en.wikipedia.org/wiki/Uniform_resource_name): Uniform Resource Name;
- [URL](http://en.wikipedia.org/wiki/Uniform_resource_locator): Uniform Resource Location:
  - [scheme](http://en.wikipedia.org/wiki/URI_scheme)
  - host
  - port
  - [path](http://en.wikipedia.org/wiki/Path_(computing)#Uniform_Naming_Convention)
  - [query parameters](http://en.wikipedia.org/wiki/Query_string)
  - [fragment](http://en.wikipedia.org/wiki/Fragment_identifier)

**Note**: the ```<hierarchical part>``` is made up of ```<host>:<port>/<path>```. The sub-part ```<host>:<port>``` is also known as ```<authority>```.

```
|<uri>-------------------------------------------|
<scheme>://<host>:<port>/<path>?<query>#<fragment>
          |-<authority>-|
          |<hierarchical part>-|
```

**Note**: the URI general syntax is defined in the [RFC 3986](http://tools.ietf.org/html/rfc3986) and in the standard [STD66](http://tools.ietf.org/html/std66).

To fully understand REST it is important to understand the concept of [Semantic URL](http://en.wikipedia.org/wiki/Semantic_URL):

> Semantic URLs, also sometimes referred to as clean URLs, RESTful URLs, user-friendly URLs, or SEO-friendly URLs, are Uniform Resource Locators ( URLs ) intended to improve the usability and accessibility of a website or web service by being immediately and intuitively meaningful to non-expert users.

## 2.1. Hello World

Deliver a WAR file, with a **Greeter** class which defines a method that answers requests like http://localhost:[PORT]/dojo-jaxrs/rest/hello. The response is a simple "Hello, World!" string. The method type is GET and there's no need for PathParameters or QueryParameters.

- Code **ApplicationWrapper** class, annotated with _path_ "rest/";
- Code **Greeter** class, with ```greet()``` method annotated with _path_ "hello/" and annotated as of type GET;
- Package a WAR file, named dojo-jaxrs.war;
- Deploy the WAR file on a Java Application Server, for example: on a GlassFish domain, with portbase 10000;
- Verify the WADL file at http://localhost:100080/dojo-jaxrs/rest/application.wadl.

## 2.2. Hello Someone

Deliver a WAR file, with an improved **Greeter** class which defines a method that answers requests like http://localhost:[PORT]/dojo-jaxrs/rest/greet?name={name}. The response is a simple "Hello, ${name}!" string when query parameter name is defined or "Hello, World!" when it's not defined. The method type is GET and there's no need for PathParameters.

- Don't change **ApplicationWrapper** class, annotated with _path_ "rest/";
- Change **Greeter** class, with ```greet( name )``` method annotated with _path_ "greet/" and annotated as of type GET;
- Package a WAR file, named dojo-jaxrs.war;
- Deploy the WAR file on a Java Application Server, for example: on a GlassFish domain, with portbase 10000;
- Verify the WADL file at http://localhost:100080/dojo-jaxrs/rest/application.wadl.

**Note**: to avoid **if** statements it's possible to define a default value for a query parameter, by using @DefaultValue annotation.

## 2.3. Checksum

Deliver a WAR file, with a new **ChecksumService** class which defines methods that answers requests like http://localhost:[PORT]/dojo-jaxrs/rest/checksum/{algorithm}. These methods are of type POST.

- Change **ApplicationWrapper** class, annotated with _path_ "rest/", to include the new class;
- Code **ChecksumService** class, annotated with _path_ "checksum/" and with the following methods:
  - ```calculateCRC32( text )```, annotated with path "crc32/";
  - ```calculateHash( algorithm, text )``` annotated with path "{algorithm}".
- Package a WAR file, named dojo-jaxrs.war;
- Deploy the WAR file on a Java Application Server, for example: on a GlassFish domain, with portbase 10000;
- Verify the WADL file at http://localhost:100080/dojo-jaxrs/rest/application.wadl.

**Note**: optionally, add another method named ```listAlgorithms()``` annotated with path "/" and annotated as of type GET, that outputs the list of HashAlgorithms available. This list can be in the format plain text or XML or JSON, using the annotation @Produces.

# 3. TDD - Test-Driven Development

Using [JUnit](http://junit.org/) or [TestNG](http://testng.org/) start by coding the validation test cases for each milestone and follow the red-green-refactor TDD rhythm.

With Ant it's not hard to setup a **test** target although Maven and Gradle are better suited for this, since their lifecycle includes testing.

# 4. Tools

## 4.1. SoapUI

[SoapUI](http://www.soapui.org/) is usually used to test and mock SOAP Web Services but it is also capable of [testing REST](http://www.soapui.org/rest-testing.html) Web Services, given a WADL.

## 4.2. Chrome Extensions

- [DHC](https://chrome.google.com/webstore/detail/dhc-resthttp-api-client/aejoelaoggembcahagimdiliamlcdmfm): DHC (aka Dev HTTP Client) is designed and developed by developers for developers to make direct HTTP/REST resource discovery, manipulation and testing more easily. Beside the main function, sending/receiving custom HTTP/REST requests/responses, it allows permanently to save a request to a local repository for later reuse and moreover the request declaration can include variables that are context specific;
- [Postman REST Client](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm?hl=en): Postman helps you be more efficient while working with APIs. Postman is a scratch-your-own-itch project. The need for it arose while one of the developers was creating an API for his project. After looking around for a number of tools, nothing felt just right. The primary features added initially were a history of sent requests and collections;
- [RestEasy](https://chrome.google.com/webstore/detail/resteasy/nojelkgnnpdmhpankkiikipkmhgafoch): RestEasy is a tool that is targeted against developers who perform RESTful API calls against third party services. It allows developers a way of being able to debug and analyze an Http request/response.;
- [Advanced REST Client](https://chrome.google.com/webstore/detail/advanced-rest-client/hgmloofddffdnphfgcellkdfbfbjeloo/reviews?hl=en-US&utm_source=ARC): The web developers helper program to create and test custom HTTP requests;
- [REST Console](https://chrome.google.com/webstore/detail/rest-console/cokgbflfommojglbmbpenpphppikmonn?hl=en): REST Console is an HTTP Request Visualizer and Constructor tool, helps developers build, debug and test RESTful APIs.
