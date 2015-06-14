:: Dojo :: JAX-RS ::
====================

----

# 1. Introdução

> **JAX-WS** or _Java API for XML Web Services_ is a Java programming language API for creating web services in [SOAP](https://en.wikipedia.org/wiki/SOAP). JAX-WS is one of the Java XML programming APIs. JAX-WS uses annotations, introduced in Java SE 5, to simplify the development and deployment of web service clients and endpoints. It is part of the Java Web Services Development Pack. JAX-WS can be used in Java SE starting with version 6. JAX-WS 2.0 replaced the JAX-RPC API in Java Platform, Enterprise Edition 5 which leans more towards document style Web Services.

> [SOAP](https://en.wikipedia.org/wiki/SOAP), originally an acronym for _Simple Object Access Protocol_, is a protocol specification for exchanging structured information in the implementation of web services in computer networks. It uses XML Information Set for its message format, and relies on other application layer protocols, most notably Hypertext Transfer Protocol ( HTTP ) or Simple Mail Transfer Protocol ( SMTP ), for message negotiation and transmission.

> SOAP was designed as an object-access protocol in 1998 by Dave Winer, Don Box, Bob Atkinson, and Mohsen Al-Ghosein for Microsoft, where Atkinson and Al-Ghosein were working at the time. The [SOAP specification](http://www.w3.org/TR/soap/) is currently maintained by the XML Protocol Working Group of the World Wide Web Consortium.

[Metro](https://metro.java.net/) is the reference implementation and the API is specified at [https://jax-ws.java.net/).

> **JAXB** or _Java Architecture for XML Binding_ allows Java developers to map Java classes to XML representations. JAXB provides two main features: the ability to marshal Java objects into XML and the inverse, i.e. to unmarshal XML back into Java objects. In other words, JAXB allows storing and retrieving data in memory in any XML format, without the need to implement a specific set of XML loading and saving routines for the program's class structure. JAXB is a part of the Java SE platform and one of the APIs in the Java EE platform, and is part of the Java Web Services Development Pack (JWSDP).

[Metro](https://metro.java.net/) is the reference implementation and the API is specified at [https://jaxb.java.net/).

## 1.1. Goal & Objetives

The objective of this dojo is to give an introduction to JAX-WS and JAXB APIs through several small and simple coding exercises.

The goal on each milestone is to access a fully defined [WSDL](https://en.wikipedia.org/wiki/Web_Services_Description_Language). The data, also known as payload, is in XML ( inside the SOAP envelope ). The deliverables on each milestone must FIXME

By the end of the dojo the programmer should be able to understand and use the following [JAX-WS annotations](https://jax-ws.java.net/nonav/2.2.10/docs/ch03.html#users-guide-annotations) and [JAXB annotations](https://jaxb.java.net/tutorial/section_6_1-JAXB-Annotations.html#JAXB Annotations):

- JAX-WS:
  - [@WebService](http://docs.oracle.com/javase/6/docs/api/javax/jws/WebService.html)
  - [@WebMethod](http://docs.oracle.com/javase/6/docs/api/javax/jws/WebMethod.html)
  - [@WebParam](http://docs.oracle.com/javase/6/docs/api/javax/jws/WebParam.html)
  - [@WebResult](http://docs.oracle.com/javase/6/docs/api/javax/jws/WebResult.html)
  - [@SOAPBinding](https://docs.oracle.com/javase/6/docs/api/javax/jws/soap/SOAPBinding.html)
- JAXB:
  - [@XmlRootElement](http://docs.oracle.com/javaee/5/api/javax/xml/bind/annotation/XmlRootElement.html)
  - [@XmlElement](http://docs.oracle.com/javaee/5/api/javax/xml/bind/annotation/XmlElement.html)
  - [@XmlAttribute](http://docs.oracle.com/javaee/5/api/javax/xml/bind/annotation/XmlAttribute.html)
  - [@XmlAccessorType](http://docs.oracle.com/javaee/5/api/javax/xml/bind/annotation/XmlAccessorType.html)
  - [@XmlType](http://docs.oracle.com/javaee/5/api/javax/xml/bind/annotation/XmlType.html)
  - [@XmlTransient](http://docs.oracle.com/javaee/5/api/javax/xml/bind/annotation/XmlTransient.html)

**Note**: although being a simple dojo it is assumed that programmers know how to work with Ant or Maven or Gradle and have full access to a Java Application Server, such as GlassFish.

## 1.2. Audience

This dojo is aimed for programmers that know Java but have not yet had used JAX-WS and JAXB APIs.

## 1.3. History

- JAX-WS 2.0: corresponds to [JSR 224](https://jcp.org/en/jsr/detail?id=224) and is part of Java SE 6;
- JAXB 2.2.8: part of Java SE 8;
- JAXB 2.2.3: corresponds to [JSR 222](https://jcp.org/en/jsr/detail?id=222) and is part of Java SE 7;
- JAXB 2.0: corresponds to [JSR 222](https://jcp.org/en/jsr/detail?id=222) and is part of Java SE 6;
- JAXB 1.0: corresponds to [JSR 31](https://jcp.org/en/jsr/detail?id=031).

----

# 2. Milestones

It's important to understand the SOAP envelope. It's in XML and is made up of 2 parts: an header and a body. Usually the header is used for authentication or control and body is used to pass data in a structured form.

It's also important to understand XML namespaces.

## 2.1. Hello World

Deliver a WAR file, with a **Greeter** class which defines a method that answers requests like http://localhost:[PORT]/dojo-jaxrs/Greeter?wsdl. It provides one method only, ```greet()```, that returns the string "Hello, World!".

- Code the **GreeterInterface** interface, annotated with FIXME and that declares the method ```greet()```;
- Code the **Greeter** class, which implements the above interface, with ```greet()``` method annotated with FIXME;
- Package a WAR file, named dojo-jaxrs.war;
- Deploy the WAR file on a Java Application Server, for example: on a GlassFish domain, with portbase 10000;
- Verify the WSDL file at http://localhost:100080/dojo-jaxrs/Greet?wsdl.

**Note**: the interface is optional but since it's a best-practice one should be familiar with the pair of interface and implementation for a WebService.

## 2.2. Hello Someone

Deliver a WAR file, with an improved **Greeter** class which defines a new method that answers requests with a name between ```<name>``` tag. This method, ```greet( name )```, returns the string "Hello, World!" if the value if null or "Hello, {name}!" when the value is not null.

- Improve the interface **GreeterInterface** class, with the new declaration for the method ```greet( name )```;
- Improve the **Greeter** class, which implements the above interface, with ```greet( name )``` method annotated with FIXME;
- Package a WAR file, named dojo-jaxrs.war;
- Deploy the WAR file on a Java Application Server, for example: on a GlassFish domain, with portbase 10000;
- Verify the WSDL file at http://localhost:100080/dojo-jaxrs/Greet?wsdl.

**Note**: a WebService can provide several methods, which should be related in some easily understandable way.

## 2.3. Checksum

Deliver a WAR file, with a new **ChecksumService** class which defines a new method that answers requests with an algorithm between ```<algorithm>``` tag and a list of several text values between ```<values>``` tag, which contains n elements of ```<text>``` tags. This method, ```checksum( algorithm, values )```, returns the a response in a format similar to the request but where each ```<text>``` tag as a new attribute "checksum" with the result of computing the checksum in the given algorithm over each of the text values.

- Code a new **ChecksumServiceRequest** and **ChecksumServiceResponse**, using JAXB annotations to represent the data in the request body and in the response body, respectively;
- Code a new **ChecksumServiceInterface** interface, annotated with FIXME and that declares the method ```checksum()```;
- Code a new **ChecksumService** class, which implements the above interface, with ```checksum()``` method annotated with FIXME;
- Package a WAR file, named dojo-jaxrs.war;
- Deploy the WAR file on a Java Application Server, for example: on a GlassFish domain, with portbase 10000;
- Verify the WSDL file at http://localhost:100080/dojo-jaxrs/ChecksumService?wsdl.

**Note**: optionally, add another method named ```listAlgorithms()``` annotated with FIXME, that outputs the list of HashAlgorithms available in XML format.

# 3. TDD - Test-Driven Development

Using [JUnit](http://junit.org/) or [TestNG](http://testng.org/) start by coding the validation test cases for each milestone and follow the red-green-refactor TDD rhythm.

With Ant it's not hard to setup a **test** target although Maven and Gradle are better suited for this, since their lifecycle includes testing.

# 4. Tools

## 4.1. SoapUI

[SoapUI](http://www.soapui.org/) is usually used to test and mock SOAP Web Services, given a WSDL.

## 4.2. Chrome Extensions

- [Wizdler](https://chrome.google.com/webstore/detail/wizdler/oebpmncolmhiapingjaagmapififiakb?hl=en): Recognizes WSDL information on the page to show you the available services and operations. Click the operation to generate the SOAP requests and view the response. By clicking the service, you can download WSDL and external XSD files in single ZIP file.
