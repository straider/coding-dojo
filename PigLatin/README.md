Java / PigLatin
===============

----

# 1. Introduction

This coding dojo was opened after realizing that HelloWorld is too simple for a sample project with Unit Tests and Integration Tests. Another option would be to work with ChecksumService, already used in JAX-WS and JAX-RS katas, but it too wasn't challenging enough for practising TDD and BDD, although it suitable for Unit Tests and Integration Tests.

A funnier and a bit more complex challenge is required and the purpose of this coding dojo is to evaluate how suitable PigLatin can be for TDD / BDD and for later on to be the basis of sample projects to evaluate Java and Groovy Builder Tools ( Ant, Maven, Gradle ). The sample project must have distinct folders for Unit Test sources and Integration Test sources and resources.

A cool resource for integration testing purposes is an input file with sentences to be fully translated from English to PigLatin using a SOAP or REST web service to perform the translation of each word.

## 1.1. Goal & Objectives

- Follow the TDD Rhythm - RED -> GREEN -> Refactor - to design the code using unit tests;
- Apply BDD by having integration tests following Given .. When .. Then;
- Evaluate how adequate the result is to be used as a sample project for Builder's katas;

## 1.2. Audience

This dojo is suitable for Java programmers of any level that want to exercise with a simple kata made of string manipulation, files and web services challenges.

## 1.3. Resources

- [Pig Latin](https://en.wikipedia.org/wiki/Pig_Latin)
- [What's the origin of pig Latin?](http://www.straightdope.com/columns/read/2163/whats-the-origin-of-pig-latin)
- [Where did Pig Latin come from?](http://ialwayswondered.jarrettgreen.com/2011/05/25/where-did-pig-latin-come-from/)
- [The Pig Latins of 11 Other Languages](http://mentalfloss.com/article/50242/pig-latins-11-other-languages)
- [English to Pig Latin Translator](http://www.snowcrest.net/donnelly/piglatin.html)
- [Useful phrases in Pig Latin](http://www.omniglot.com/language/phrases/piglatin.htm)
- [Algorithm Pig Latin](https://github.com/FreeCodeCamp/FreeCodeCamp/wiki/Algorithm-Pig-Latin)
- [Igpay Atinlay](https://www.codechef.com/problems/CEXP06)
- [Pig Latin](http://web.ics.purdue.edu/~morelanj/RAO/prepare2.html)

----

# 2. Problem Statement

## 2.1. Rules

- If word starts with a vowel ( a, e, i, o, u ) then "way" is appended to the end of the word without modifying it;
- If word starts with a consonant ( including y ) then "ay" is appended to the end of the word with consonants moved to end of it;
- If word starts with several consonants then all of them are moved to the end of the word, instead of just the first one;
- If word starts in uppercase then first vowel is changed to uppercase too;
- If word has mixed uppercase and lowercase letters then only starting consonants and first vowel change case;
- If word is all uppercase then suffix "way" or "ay" are also in uppercase;
- If word is just a vowel, even if uppercase, then suffix "way" is in lowercase;
- The letter y is considered a vowel if is not the first letter of the word;
- The compound words with hyphenation are treated as 2 words.

## 2.2. Examples

### 2.2.1. Simple Cases

| English    | PigLatin     | Obs.                |
|------------|--------------|---------------------|
| apple      | appleway     | Lowercase vowel     |
| Apple      | Appleway     | Uppercase vowel     |
| hello      | ellohay      | Lowercase consonant |
| Hello      | Ellohay      | Uppercase consonant |
| chest      | estchay      | Several consonants  |
| pascalCase | ascalCasepay | lowercase Uppercase |
| CamelCase  | AmelCasecay  | Uppercase Uppercase |

### 2.2.2. Edge Cases

| English | PigLatin | Obs.                          |
|---------|----------|-------------------------------|
| a       | away     | Single vowel                  |
| I       | Iway     | Vowel considered lowercase    |
| b       | bay      | Single consonant              |
| Y       | YAY      | All uppercase                 |
| euouaeb | euouaeay | [Word without consonants](https://en.wikipedia.org/wiki/Words_without_consonants#English) |
| crwth   | crwthay  | [Word without vowels](https://en.wikipedia.org/wiki/English_words_without_vowels) |
| sky     | sky      | Or yskay, if Y can be a vowel |
| Sky     | Sky      | Or Yskay, if Y can be a vowel |
| SKY     | SKY      | Or YSKAY, all uppercase       |
| [EMPTY] |          | Empty string is empty         |
| [NULL]  |          | No string is empty            |

### 2.2.3. Complex Cases

| English    | PigLatin       | Obs.              |
|------------|----------------|-------------------|
| quiet      | ietquay        | QU as a consonant |
| style      | ylestay        | Y as a vowel      |
| yellow     | ellowyay       | Y as a consonant  |
| high-level | ighhay-evellay | [Hyphenation](https://en.wikipedia.org/wiki/English_compound#Hyphenation) |
| aye-aye    | ayeway-ayeway  |                   |

----

# 3. Milestones

## 3.1. Unit Test Cases

## 3.1.1. Simple Cases

- Lowercase vowel;
- Uppercase vowel;
- Lowercase consonant;
- Uppercase consonant;
- Several starting consonants;
- pascalCase and CamelCase.

## 3.1.2. Edge Cases

- Single lowercase vowel;
- Single uppercase vowel;
- Single lowercase consonant;
- Single uppercase consonant;
- Word without consonants;
- Word without vowels;
- Empty and null string.

## 3.1.3. Complex Cases

- Starting with "qu";
- Y as a vowel;
- Y at start is always a consonant;
- Hyphenated compound word is treated as 2 words.

## 3.2. Integration Test Cases

### 3.2.1. Mock User Input

### 3.2.2. Mock Source File

### 3.2.3. Web Service

#### 3.2.3.1. Resources

- [HTTP Request Methods](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods)
- [Standard HTTP Methods](http://restful-api-design.readthedocs.io/en/latest/methods.html)
- [When should we use PUT and when should we use POST?](http://restcookbook.com/HTTP%20Methods/put-vs-post/)
- [What are idempotent and/or safe methods?](http://restcookbook.com/HTTP%20Methods/idempotency/)
- [Using HTTP Methods for RESTful Services](http://www.restapitutorial.com/lessons/httpmethods.html)
- [Understanding REST](https://spring.io/understanding/REST)
- [Rest vs Soap- NordicAPIs infographic Comparison](http://nordicapis.com/rest-vs-soap-nordic-apis-infographic-comparison/)
- [Is REST better than SOAP? Yes, in Some Use Cases](http://nordicapis.com/rest-better-than-soap-yes-use-cases/)
- [Web Services Architecture – When to Use SOAP vs REST](https://dzone.com/articles/web-services-architecture)
- [Tip: SOAP 1.2 and the GET request](http://www.ibm.com/developerworks/xml/library/x-tipgetr/index.html)

#### 3.2.3.2. SOAP

- translate single word;
- translate phrases;
- translate paragraphs.

#### 3.2.3.3. REST

- translate single word (GET);
- translate phrases (PUT);
- translate paragraphs (PUT).

**Note**: An alternative to PUT is using POST, which is the [only method with SOAP](http://www.ibm.com/developerworks/xml/library/x-tipgetr/index.html) (until SOAP 1.2), if the focus is more on [processing](http://www.w3schools.com/TAGS/ref_httpmethods.asp) rather than [semantics and content](https://tools.ietf.org/html/rfc7231):
- GET is used to request data from a given resource, with none or without much processing;
- POST is used to submit data to be processed to a given resource.

----

# 4. Notes
