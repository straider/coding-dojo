coding-dojo / DesignPatterns
============================

Dojo with examples of design patterns.

# Introduction

> In software engineering, a **design pattern** is a general reusable solution to a commonly occurring problem within a given context in software design.

## Roots

The term [Design Patterns](http://en.wikipedia.org/wiki/Design_Patterns), along with their description and original categories, was coined by the [GoF](http://c2.com/cgi/wiki?GangOfFour) ( Gang of Four ) in the book **Design Patterns: Elements of Reusable Object-Oriented Software**, published on October 21, 1994. The 4 authors are:

- [Erich Gamma](http://en.wikipedia.org/wiki/Erich_Gamma)
- [John Vlissides](http://en.wikipedia.org/wiki/John_Vlissides)
- [Ralph Johnson](http://en.wikipedia.org/wiki/Ralph_Johnson_%28computer_scientist%29)
- [Richard Helm]()

## Why

### Advantages

- Allows programmers to have a common, precise and succinct vocabulary for well known best practices;
- Are well documented and tested best practices;
- Are widely used in both language libraries and real case applications.

### Disadvantages

- These best pratices focus more on Object Oriented paradigm and may not be useful in other programming paradigms, such as functional paradigm;
- More recent object oriented languages may not demand a great knowledge of these design patterns, since they don't suffer from the same problems as C++ or Java;
- The use of design patterns often leads to complexity, that may be out of purpose for a given situation.

## Principles

These are the common principles to follow when programming in an object oriented language:
- Abstraction;
- Encapsulation;
- Inheritance;
- Polymorphism.

There are [**S.O.L.I.D**](http://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) principles to follow, suitable to object oriented and other programming paradigms:
- **Single Responsibility Principle** ( [SRP](https://docs.google.com/file/d/0ByOwmqah_nuGNHEtcU5OekdDMkk/edit?pli=1) ): A class should have one, and only one, reason to change;
- **Open-Closed Principle** ( [OCP](https://drive.google.com/file/d/0BwhCYaYDn8EgN2M5MTkwM2EtNWFkZC00ZTI3LWFjZTUtNTFhZGZiYmUzODc1/view) ): You should be able to extend a classes behavior, without modifying it;
- **Liskov Substitution Principle** ( [LSP](https://drive.google.com/file/d/0BwhCYaYDn8EgNzAzZjA5ZmItNjU3NS00MzQ5LTkwYjMtMDJhNDU5ZTM0MTlh/view) ): Derived classes must be substitutable for their base classes;
- **Interface Segregation Principle** ( [ISP](https://drive.google.com/file/d/0BwhCYaYDn8EgOTViYjJhYzMtMzYxMC00MzFjLWJjMzYtOGJiMDc5N2JkYmJi/view) ): Make fine grained interfaces that are client specific;
- **Dependency Inversion Principle** ( [DIP](https://drive.google.com/file/d/0BwhCYaYDn8EgMjdlMWIzNGUtZTQ0NC00ZjQ5LTkwYzQtZjRhMDRlNTQ3ZGMz/view) ): Depend on abstractions, not on concretions.

> SOLID is a mnemonic invented by Michael Feathers that stands for and advocates five programming practices. The [principles](http://www.butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod) were introduced by [Robert C. Martin](http://en.wikipedia.org/wiki/Robert_Cecil_Martin) ( Uncle Bob ).

The design patterns advocate the following principles ( best practices ), from Head First Design Patterns book:
- Encapsulate what varies;
- Favor _object composition_ over _class inheritance_ ( ISP, DIP );
- Program to an _interface_, not an _implementation_ ( DIP );
- Strive for _loosely coupled_ designs with _high cohesion_ factor;
- Classes should be open for extension but closed for modification ( OCP );
- Depend on _abstractions_ instead of _concrete_ ( DIP );
- Only talk to your friends;
- "Don't call us, we'll call you" ( Hollywood Principle );
- A class should have only one reason to change ( SRP ).

> A design pattern exists if
- _Given_ a **context** ( recurring situation );
- _When_ there's a **problem** ( goal and constraints );
- _Then_ apply this **solution** ( generic design ).

## Catalog Outline

- **Name and Classification**: A descriptive and unique name that helps in identifying and referring to the pattern;
- **Intent**: A description of the goal behind the pattern and the reason for using it;
- **Also Known As**: Other names for the pattern;
- **Motivation** ( Forces ): A scenario consisting of a problem and a context in which this pattern can be used;
- **Applicability**: Situations in which this pattern is usable; the context for the pattern;
- **Structure** ( Class Design / Diagram ): A graphical representation of the pattern;
- **Participants**: A listing of the classes and objects used in the pattern and their roles in the design;
- **Collaboration**: A description of how classes and objects used in the pattern interact with each other;
- **Consequences**: A description of the results, side effects, and trade offs caused by using the pattern;
- **Implementation Details**: A description of an implementation of the pattern; the solution part of the pattern;
- **Sample Code**: An illustration of how the pattern can be used in a programming language;
- **Well Known Uses**: Examples of real usages of the pattern;
- **Related Patterns**: Other patterns that have some relationship with the pattern; discussion of the differences between the pattern and similar patterns.

# Categories

## Creational

- Abstract Factory
- Factory Method
- Builder
- Prototype
- Singleton

There are not part of the original GoF Design Pattens:
- Multiton
- Object Pool
- Resource acquisition is initialization

## Structural

- Adapter
- Bridge
- Composite
- Decorator
- Facade
- Flyweight
- Proxy

There are not part of the original GoF Design Pattens:
- Front Controller
- Module
- Private Class Data
- Twin

## Behavioral

- Chain of Responsibility
- Command
- Interpreter
- Iterator
- Mediator
- Memento
- Observer
- State
- Strategy
- Template Method
- Visitor

There are not part of the original GoF Design Pattens:
- Blackboard
- Null Object
- Servant
- Specification
