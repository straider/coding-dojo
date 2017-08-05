:: Java :: EIP :: Camel :: Greeter ::
=====================================

# Overview

In order to learn about Camel and how to run in, from standalone mode to container mode on Fuse Integration Services, a simple challenge is required.

This challenge demands 2 Camel applications that simulate 2 distinct integrations:
- one integration provides a REST service for the "old" greeting service;
- another integration deals asynchronously with a "legacy" slow persistence layer, which often fails.

## Requirements

- The service is implemented by 2 integrations:
    - REST: 2x routes, one for each method:
        - GET for greeting message;
        - PUT for configuring new greeting greeting.
    - JMS: 1x route to store the new greeting greeting.
- The service availability should be high:
    - If REST routes are up but JMS route is down then it should discard requests for changing greeting greeting;
    - The JMS route has 2 outbound routes:
        - To the slow and unreliable persistence layer;
        - To a fast (cache) persistence layer, used by the REST integration.
- Use JUnit for Unit Tests, in Groovy;
- Use Spock / Cucumber for Integration Tests, in Groovy;

## Scope

Use the following components:
- CXF for REST routes;
- ActiveMQ for JMS route;
- File for fast (cache) persistence layer;
    - Does not need FTP, SFTP or shared folders;
    - May need Master component when running in multiple containers?
- MyBatis (or other) with H2 for slow persistence layer.

## User Stories

### Base Greeter

### REST integration

#### Get Greeting Message

- Consumes a plain text request, with a query parameter **name**;
- May consume a JSON request, like the example below;
- Enriches data by reading the current greeting greeting from fast persistence layer into a greeter object;
- Returns HTTP code 200 - OK - with the response generated by the greeter object.

```json
{
    name: "José Carlos"
}
```

#### Put Greeting Format

- Consumes a JSON request, like the example below;
- Unmarshalls the JSON request to a greeter object;
- Sends the Greeter object to JMS integration;
- Responds with the proper HTTP code:
    - 200: OK if JMS integration accepts the message;
    - 500: ERROR because JMS integration is down.

```json
{
    greeting: "Welcome"
}
```

### JMS integration

- Consumes a JMS message that contains a greeter object;
- Gets the message greeting set on the greet object;
- Saves the message greeting to the fast persistence layer;
- Stores the message greeting in the slow persistence layer.

**Note**: Using H2, with MyBatis or other ORM, is optional. The slow persistence layer may just be another folder on the filesystem where the fast persistence layer caches the current message greeting.

### Standalone

- How to run 2x integrations as normal Java applications?

### Spring Boot

- How to run 2x integrations as Spring Boot applications?
    - With Camel Main context;
    - With Camel Spring context.

### OSGi Bundle Server

- How to bundle 2x OSGi integrations?
    - Could use Spring Dynamic Modules / Eclipse Gemini Blueprint;
    - Should use Apache Aires Blueprint.
- How and where to deploy 2x OSGi bundles?
- Common troubleshoot tips when dealing with OSGi bundles.

### OSGi Bundle Container

- How to bundle 2x OSGi integrations in containers?
- How to deploy 2x OSGi containers?
- Common troubleshoot tips when dealing with OSGi containers.
