Quick Reference Guide
=====================

# 9. Objects

> An **Object** is an unique instance of a data structure that's defined by its class. An object comprises both data members ( class variables and instance variables ) and methods.

> A **Class** is an user-defined prototype for an object that defines a set of attributes that characterize any object of the class. The attributes are data members ( class variables and instance variables ) and methods, accessed via dot notation.

> An **Instance** is an individual object of a certain class.

## 9.1. Classes

> The **class** statement creates a new class definition. The name of the class immediately follows the keyword class followed by a colon as follows:

```python
class ClassName :
  'Optional class documentation string'
  class_suite
```

> The class_suite consists of all the component statements defining class members, data attributes and functions. To create instances of a class, you call the class using class name and pass in whatever arguments its ```__init__()``` method accepts.

### 9.1.1. Attributes

> You access the object's attributes using the dot operator with object.

> A **Class variable** is a variable that is shared by all instances of a class. Class variables are defined within a class but outside any of the class's methods. Class variables are not used as frequently as instance variables are. Class variable would be accessed using class name as follows:

```python
ClassName.class_variable
```

> An **Instance variable** is a variable that is defined inside a method and belongs only to the current instance of a class. Instance variable would be accessed using the instance as follows:

```python
instance = ClassName
instance.instance_variable
```

> Instead of using the normal statements to access attributes, you can use the following functions:
- The ```getattr( object, name[, default ] )```: to access the attribute of object;
- The ```hasattr( object, name )```: to check if an attribute exists or not;
- The ```setattr( object, name, value )```: to set an attribute. If attribute does not exist, then it would be created;
- The ```delattr( object, name )```: to delete an attribute by its name.

> Every Python class keeps following built-in attributes and they can be accessed using dot operator like any other attribute:
- ```__dict__```: dictionary containing the class's namespace;
- ```__doc__```: class documentation string or none, if undefined;
- ```__name__```: class name;
- ```__module__```: module name in which the class is defined. This attribute is ```__main__``` in interactive mode;
- ```__bases__```: a possibly empty tuple containing the base classes, in the order of their occurrence in the base class list.

> An object's attributes may or may not be visible outside the class definition. You need to name attributes with a double underscore prefix, and those attributes then are not be directly visible to outsiders.

> Python protects those members by internally changing the name to include the class name. You can access such attributes as ```object._className__attrName```.

### 9.1.2. Methods

Usually, in Python, a class defines one or more of the following methods:

- ```__init__ ( self [,args...] )```: constructor ( with any optional arguments );
- `` __del__( self )```: destructor, deletes an object;
- ```__repr__( self )```: evaluatable string representation;
- ```__str__( self )```: printable string representation;
- ```__cmp__ ( self, x )```: object comparison.

There are 2 different types of methods:

- **Instance** ( plain ) methods: An instance method receives the instance as its first argument;
- **Class** methods: A class method receives the class as its first argument. Define class methods with built-in function ```classmethod()``` or with decorator ```@classmethod```;
- **Static** methods: A static method receives neither the instance nor the class as its first argument. Define static methods with built-in function ```staticmethod()``` or with decorator ```@staticmethod```.

### 9.1.3. Method Overriding

### 9.1.4. Method Overloading

### 9.1.5. Abstract Classes

### 9.1.6. Freezing Objects

## 9.2. Interfaces / Modules

## 9.3. Mixins

## 9.4. Garbage Collector

> Python uses a combination of reference counting and a cycle-detecting garbage collector for memory management.

> Python deletes unneeded objects ( built-in types or class instances ) automatically to free the memory space. The process by which Python periodically reclaims blocks of memory that no longer are in use is termed Garbage Collection.

> Python's garbage collector runs during program execution and is triggered when an object's reference count reaches zero. An object's reference count changes as the number of aliases that point to it changes.

> An object's reference count increases when it is assigned a new name or placed in a container ( list, tuple, or dictionary ). The object's reference count decreases when it's deleted with del, its reference is reassigned, or its reference goes out of scope. When an object's reference count reaches zero, Python collects it automatically.

> A class can implement the special method ```__del__()```, called a **destructor**, that is invoked when the instance is about to be destroyed. This method might be used to clean up any non memory resources used by an instance.

## 9.5. Principles

### 9.5.1. Abstraction

### 9.5.2. Encapsulation


### 9.5.3. Inheritance

> Instead of starting from scratch, you can create a class by deriving it from a preexisting class by listing the parent class in parentheses after the new class name.

> The child class inherits the attributes of its parent class, and you can use those attributes as if they were defined in the child class. A child class can also override data members and methods from the parent.

> Derived classes are declared much like their parent class; however, a list of base classes to inherit from is given after the class name:

```python
class SubClassName ( ParentClass1[, ParentClass2, ... ] ) :
  'Optional class documentation string'
  class_suite
```

> You can use ```issubclass()``` or ```isinstance()``` functions to check a relationships of two classes and instances:
- The ```issubclass( subClass, superClass )``` boolean function returns true if the given subclass is indeed a subclass of the superclass;
- The ```isinstance( object, class )``` boolean function returns true if the object is an instance of class or is an instance of one of its subclasses.

### 9.5.4. Polymorphism
