:: Dojo :: JAX-RS ::
====================

----

# 1. Introduction

> **JAX-WS** or _Java API for XML Web Services_ is a Java programming language API for creating web services in [SOAP](https://en.wikipedia.org/wiki/SOAP). JAX-WS is one of the Java XML programming APIs. JAX-WS uses annotations, introduced in Java SE 5, to simplify the development and deployment of web service clients and endpoints. It is part of the Java Web Services Development Pack. JAX-WS can be used in Java SE starting with version 6. JAX-WS 2.0 replaced the JAX-RPC API in Java Platform, Enterprise Edition 5 which leans more towards document style Web Services.

> [SOAP](https://en.wikipedia.org/wiki/SOAP), originally an acronym for _Simple Object Access Protocol_, is a protocol specification for exchanging structured information in the implementation of web services in computer networks. It uses XML Information Set for its message format, and relies on other application layer protocols, most notably Hypertext Transfer Protocol ( HTTP ) or Simple Mail Transfer Protocol ( SMTP ), for message negotiation and transmission.

> SOAP was designed as an object-access protocol in 1998 by Dave Winer, Don Box, Bob Atkinson, and Mohsen Al-Ghosein for Microsoft, where Atkinson and Al-Ghosein were working at the time. The [SOAP specification](http://www.w3.org/TR/soap/) is currently maintained by the XML Protocol Working Group of the World Wide Web Consortium.

[Metro](https://metro.java.net/) is the reference implementation and the API is specified at [JAX-WS Specification](https://jax-ws.java.net/).

> **JAXB** or _Java Architecture for XML Binding_ allows Java developers to map Java classes to XML representations. JAXB provides two main features: the ability to marshal Java objects into XML and the inverse, i.e. to unmarshal XML back into Java objects. In other words, JAXB allows storing and retrieving data in memory in any XML format, without the need to implement a specific set of XML loading and saving routines for the program's class structure. JAXB is a part of the Java SE platform and one of the APIs in the Java EE platform, and is part of the Java Web Services Development Pack (JWSDP).

[Metro](https://metro.java.net/) is the reference implementation and the API is specified at [JAXB Specification](https://jaxb.java.net/).

## 1.1. Goal & Objectives

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
  - [@XmlElements](http://docs.oracle.com/javaee/5/api/javax/xml/bind/annotation/XmlElements.html)
  - [@XmlElementWrapper](http://docs.oracle.com/javaee/5/api/javax/xml/bind/annotation/XmlElementWrapper.html)
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

# 2. Resources

## 2.1. Tutorials

## 2.2. Articles

----

# 3. Milestones

It's important to understand the SOAP envelope. It's in XML and is made up of 2 parts: an header and a body. Usually the header is used for authentication or control and body is used to pass data in a structured form.

It's also important to understand XML namespaces.

## 3.1. Hello World

Deliver a WAR file, with a **Greeter** class which defines a method that answers requests like http://localhost:[PORT]/dojo-jaxws/GreeterService?wsdl. It provides one method only, ```hello()```, that returns the string "Hello, World!".

- Code the **GreeterInterface** interface, annotated with WebService, SOAPBinding and that declares the ```hello()``` method, annotated with WebMethod as "hello" and WebResult as "response";
- Code the **Greeter** class, which implements the above interface, with ```hello()```;
- Package a WAR file, named dojo-jaxws.war;
- Deploy the WAR file on a Java Application Server, for example: on a GlassFish domain, with portbase 10000;
- Verify the WSDL file at http://localhost:100080/dojo-jaxws/GreeterService?wsdl.

**Note**: the interface is optional but since it's a best-practice one should be familiar with the pair of interface and implementation for a WebService.

## 3.2. Hello Someone

Deliver a WAR file, with an improved **Greeter** class which defines a new method that answers requests with a name between ```<name>``` tag. This method, ```greet( name )```, returns the string "Hello, World!" if the value if null or "Hello, {name}!" when the value is not null.

- Improve the **GreeterInterface** interface, with the new declaration for the ```greet( name )``` method, annotated with WebMethod as "greet" and WebResult as "response";
- Improve the **Greeter** class, which implements the above interface, with ```greet( name )``` method;
- Package a WAR file, named dojo-jaxws.war;
- Deploy the WAR file on a Java Application Server, for example: on a GlassFish domain, with portbase 10000;
- Verify the WSDL file at http://localhost:100080/dojo-jaxws/GreeterService?wsdl.

**Note**: a WebService can provide several methods, which should be related in some easily understandable way.

## 3.3. Checksum

Deliver a WAR file, with a new **Checksumer** class which defines new methods that answers requests with an algorithm between ```<algorithm>``` tag and a text value between ```<text>``` tag. This method, ```checksum( algorithm, text )```, returns the response as a string.

- Code a new **ChecksumerInterface** interface, annotated with WebService, SOAPBinding and that declares the methods:
  - ```calculateCRC32( text )```, annotated with WebMethod as "crc32" and WebResult as "response";
  - ```calculateHash( algorithm, text )```, annotated with WebMethod as "hash" and WebResult as "response";
- Code a new **Checksumer** class, which implements the above interface;
- Package a WAR file, named dojo-jaxws.war;
- Deploy the WAR file on a Java Application Server, for example: on a GlassFish domain, with portbase 10000;
- Verify the WSDL file at http://localhost:100080/dojo-jaxws/ChecksumerService?wsdl.

**Note**: optionally, add another method named ```listAlgorithms()``` annotated with annotated with WebMethod as "list" and WebResult as "response", that outputs the list of HashAlgorithms available, serialized as a string.

## 3.4. Checksum Multiple Algorithm

Deliver a WAR file, with an improved **Checksumer** class which defines a new method that answers requests a text value between ```<text>``` tag. This method, ```calculateHashes( text )```, returns the response in an XML format.

- Code a new **MultipleAlgorithmsResponse** class, using JAXB annotations to represent the data in the response body;
- Improve the **ChecksumerInterface** interface, by declaring the new method ```calculateHashes( text )``` annotated with WebMethod as "hashes" and WebResult as "response";
- Improve the **Checksumer** class, which implements the above interface;
- Package a WAR file, named dojo-jaxws.war;
- Deploy the WAR file on a Java Application Server, for example: on a GlassFish domain, with portbase 10000;
- Verify the WSDL file at http://localhost:100080/dojo-jaxws/ChecksumerService?wsdl.

The response XML, roughly, should be something like this:

```xml
<response>
  <list>
    <value>...</value>
  </list>>
</response>
```

## 3.5. Checksum Multiple Values

Deliver a WAR file, with an improved **Checksumer** class which defines a new method that answers requests which define an algorithm between ```<algorithm>``` tag a a list of text values between ```<list>``` tag, where each element of this list is a value defined between ```<text>``` tag. This method, ```processMultiple( request )```, returns the response in an XML format.

- Code new **MultipleValuesRequest** and **MultipleValuesResponse** classes, using JAXB annotations to represent the data in the request body and in the response body, respectively;
- Improve the **ChecksumerInterface** interface, by declaring the new method ```processMultiple( request )``` annotated with WebMethod as "hashes" and WebResult as "response";
- Improve the **Checksumer** class, which implements the above interface;
- Package a WAR file, named dojo-jaxws.war;
- Deploy the WAR file on a Java Application Server, for example: on a GlassFish domain, with portbase 10000;
- Verify the WSDL file at http://localhost:100080/dojo-jaxws/ChecksumerService?wsdl.

The request XML, roughly, should be something like this:

```xml
<request>
  <algorithm>...</algorithm>
  <list>
    <text>...</text>
  </list>>
</request>
```

The response XML, roughly, should be something like this:

```xml
<response>
  <algorithm>...</algorithm>
  <list>
    <item>
      <text>...</text>
      <hash>...</hash>
    </item>
  </list>>
</response>
```

----

# 4. TDD - Test-Driven Development

Using [JUnit](http://junit.org/) or [TestNG](http://testng.org/) start by coding the validation test cases for each milestone and follow the red-green-refactor TDD rhythm.

With Ant it's not hard to setup a **test** target although Maven and Gradle are better suited for this, since their lifecycle includes testing.

----

# 5. Tools

## 5.1. SoapUI

[SoapUI](http://www.soapui.org/) is usually used to test and mock SOAP Web Services, given a WSDL.

## 5.2. Chrome Extensions

- [Wizdler](https://chrome.google.com/webstore/detail/wizdler/oebpmncolmhiapingjaagmapififiakb?hl=en): Recognizes WSDL information on the page to show you the available services and operations. Click the operation to generate the SOAP requests and view the response. By clicking the service, you can download WSDL and external XSD files in single ZIP file.

