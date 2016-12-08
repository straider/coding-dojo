:: Dojo :: Java :: WebServices ::
=================================

----

# 1. Introduction

## 1.1. Goal & Objectives

The goal of this dojo is to act as a laboratory to experiment with SOAP and REST WebServices. For each web service type there are 2 parts: a server and a client. It must be possible to use a client done in one framework to connect with a server done in another framework. In the case of SOAP there should be 2 paths to follow: contract-first with a WSDL and contract-last without a WSDL.

Each solution should be complete by following the TDD methodology and committing each step of the TDD Rhythm: Red -> Green -> Refactor.

## 1.2. Audience

This dojo is aimed for programmers that know Java but have not yet had used any or some of the most often used WebServices Frameworks.

## 1.3. Frameworks

- [Metro](../APIs/jaxws/README.md) and [Jersey](../APIs/jaxrs/README.md)
- [Apache CXF](CXF/README.md)
- [Spring](Spring/README.md)

----

# 2. Resources

## 2.1. Tutorials

- [JAX-RS Tutorial](http://www.mkyong.com/tutorials/jax-rs-tutorials/)
- [How to create a simple Restful Web Service using Jersey JAX RS API](http://theopentutorials.com/examples/java-ee/jax-rs/create-a-simple-restful-web-service-using-jersey-jax-rs/)

## 2.2. Articles

- [JSR 311 Final: Java API for RESTful Web Services](https://www.infoq.com/news/2008/09/jsr311-approved)
- [A Comparison of JAX-RS Implementations](https://www.infoq.com/news/2008/10/jaxrs-comparison)
- [Apache CXF vs. Apache AXIS vs. Spring WS](https://dzone.com/articles/apache-cxf-vs-apache-axis-vs)
- [Apache Axis2, CXF and Sun JAX-WS RI in comparison](https://www.predic8.com/axis2-cxf-jax-ws-comparison.htm)
- [Difference between JAX-RS Specification Implementation tools](http://nagesh625.blogspot.co.uk/2014/01/difference-between-jax-rs-specification.html)
- [Jersey vs. RESTEasy: A JAX-RS Implementation Comparison](https://www.genuitec.com/jersey-resteasy-comparison/)
- [JAX-RS Vendor Comparisons - Part I](http://www.jroller.com/Solomon/entry/jax_rs_vendor_comparisons_part)
- [JAX-RS Spring Integration](http://www.jroller.com/Solomon/entry/jax_rs_spring_integration)

----

# 3. Milestones

## 3.1. Hello World

Simple Kata just to show that framework is correctly installed and configured.

## 3.2. Hello Someone

Simple Kata to show that WebService endpoints can handle primitive types.

## 3.3. Checksum

Simple Kata to show that WebService endpoints can handle several primitive types.

## 3.4. Checksum Multiple Algorithm

Medium Kata to show that a WebService can have several endpoints.

## 3.5. Checksum Multiple Values

Complex Kata to show that complex data types can be handled, by SOAP and by REST (with XML or JSON).

----

# 4. TDD - Test-Driven Development

## 4.1. JUnit

## 4.2. TestNG

## 4.3. Spock

----

# 5. Tools

## 5.1. SoapUI

[SoapUI](http://www.soapui.org/) is usually used to test and mock SOAP Web Services but it is also capable of [testing REST](http://www.soapui.org/rest-testing.html) Web Services, given a WADL.

## 5.2. Chrome Extensions

- [DHC](https://chrome.google.com/webstore/detail/dhc-resthttp-api-client/aejoelaoggembcahagimdiliamlcdmfm): DHC (aka Dev HTTP Client) is designed and developed by developers for developers to make direct HTTP/REST resource discovery, manipulation and testing more easily. Beside the main function, sending/receiving custom HTTP/REST requests/responses, it allows permanently to save a request to a local repository for later reuse and moreover the request declaration can include variables that are context specific;
- [Postman REST Client](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm?hl=en): Postman helps you be more efficient while working with APIs. Postman is a scratch-your-own-itch project. The need for it arose while one of the developers was creating an API for his project. After looking around for a number of tools, nothing felt just right. The primary features added initially were a history of sent requests and collections;
- [RestEasy](https://chrome.google.com/webstore/detail/resteasy/nojelkgnnpdmhpankkiikipkmhgafoch): RestEasy is a tool that is targeted against developers who perform RESTful API calls against third party services. It allows developers a way of being able to debug and analyze an Http request/response.;
- [Advanced REST Client](https://chrome.google.com/webstore/detail/advanced-rest-client/hgmloofddffdnphfgcellkdfbfbjeloo/reviews?hl=en-US&utm_source=ARC): The web developers helper program to create and test custom HTTP requests;
- [REST Console](https://chrome.google.com/webstore/detail/rest-console/cokgbflfommojglbmbpenpphppikmonn?hl=en): REST Console is an HTTP Request Visualizer and Constructor tool, helps developers build, debug and test RESTful APIs.

