Quick Reference Guide
=====================

# 9. Objects

In Ruby everything is an object, even methods or values ( even when it's of a basic type ). The 4 principles of object oriented paradigm are:

- Abstraction
- Encapsulation
- Inheritance
- Polymorphism

An object oriented program is made up of classes and objects. A class is like the blueprint of an object and an instance is a represents the an object of that class.

> When a method is defined outside of the class definition, the method is marked as private by default. On the other hand, the methods defined in the class definition are marked as public by default.

An object has state, kept by its attributes, and behavior, declared in its methods. Therefor objects are also called smart data structures.

> **Duck Typing** means an object type is defined by what it can do, not by what it is. Duck Typing refers to the tendency of being less concerned with the class of an object and more concerned with what methods can be called on it and what operations can be performed on it.

## 9.1. Classes

> In Ruby, classes are never closed: you can always add methods to an existing class. This applies to the classes you write as well as the standard, built-in classes. All you have to do is open up a class definition for an existing class, and the new contents you specify will be added to whatever's there.

When a class is defined, between ```class [Name] .. end``` an object of type Class is created and is assigned to a constant, the name of class. When the method ```new()``` is called then an instance of that class is created, by allocating memory for the object and by calling a special initialization method: ```initialize()```. It's also possible to create an instance just by allocating memory for it without calling the initialize method. To do so, instead of ```Class.new()``` there's another method: ```Class.allocate()```.

**Attention**: instances allocated and not initialized don't have visible attributes and callable methods, they belong to class **NilClass**.

```ruby
class Car

  def initialize( brand, model, price )
    @brand = brand
    @model = model
    @price = price
  end
  
end

car = Car.new( 'Mercedes', 'Class A', 25_000 )
```

**Note**: The Ruby runtime system needs to keep track of all known objects. This information is made accessible via the ```ObjectSpace.each_object()``` method. It returns the number of objects found. Objects of Fixnums, Symbols, true, false, and nil are never returned. 

```ruby
ObjectSpace.each_object do | object |
  printf "%20s: %s\n", object.class, object.inspect
end
```

### 9.1.1. Attributes

A class can have two types of attributes:

- Class: attributes of type class ( static ) will hold the same value across multiple instances of the same object;
- Instance: attributes of type instance will hold different values per instance.

```ruby
class Klass
  @@class_attribute
  @instance_atribute
end

Klass.class_attribute
Klass.new.instance_atribute
```

There are special methods to control the access to the attributes:

- **attr_reader**: this **keyword** causes the symbol-based attributes that follow it to be read only for other objects; 
- **attr_writer**: this **keyword** causes the symbol-based attributes that follow it to be write only for other objects; 
- **attr_accessor**: this **keyword** causes the symbol-based attributes that follow it to be read or written by other objects; 

A class can also contain constants, that are accessible by using the **scope resolution operator**, "::". These constants are defined without any _sigils_, and by convention in uppercase notation.

```ruby
class Klass
  @@class_attribute
  @instance_atribute
  CONSTANT_ATTRIBUTE
end

Klass::CONSTANT_ATTRIBUTE
```

> All Ruby objects have a set of instance variables. These are not defined by the object's class - they are simply created when a value is assigned to them. Because instance variables are not defined by a class, they are unrelated to sub-classing and the inheritance mechanism.

### 9.1.2. Methods

A class can have two types of methods:

- Class: methods that don't require an instance;
- Instance: methods that require an instance.

**Attention**: a class can only have one method with a certain name. It's not possible to have multiple methods all with same name in a class.

- Class#method: this syntax denotes an instance method;
- Class.method: this syntax denotes a class method;
- Class::method: this syntax also denotes a class method.

```ruby
class Dummy
  def instance_method
    ...
  end

  def self.class_method
    ...
  end
end

Dummy.new.instance_method()
Dummy.class_method()
```

There are 3 levels of protection for methods:
- **public**: methods that are visible and callable by any object;
- **private**: methods that are only visible and callable by the class methods;
- **protected**: methods that are visible and callable by the class and sub-classes methods.

**Note**: by default all methods are declared public, except for method ```initialize()``` which is always private.

**Attention**: Private methods are inherited by subclasses. This means that subclasses can invoke them and can override them.

If a call is made to a method that doesn't exist and no method_missing handler is provided then an exception **NoMethodError** will be raised.

```ruby
class ClassAccessLevels

  def m1          # this method is public
  end

  protected

    def m2        # this method is protected
    end

  private

    def m3        # this method is private
    end
end
```

```ruby
class ClassAccessLevels

  def m1
  end

  def m2
  end

  def m3
  end

  def m4
  end

  def m5
  end

  public    :m1
  protected :m2, :m4
  private   :m3, :m5

end
```

> In Ruby, public, private and protected apply only to methods. Instance and class variables are encapsulated and effectively private, and constants are effectively public. There is no way to make an instance variable accessible from outside a class ( except by defining an accessor method ). And there is no way to define a constant that is inaccessible to outside use.

- ```object_id()```: retrieves the unique object ID; 
- ```instance_of?()```: returns true if the instance is of a given class; 
- ```methods.sort```: retrieves a list of all the methods;
- ```instance_methods.sort```: retrieves a list of all the instance methods;
- ```instance_methods( false ).sort```: retrieves a list of the instance methods without those of the ancestor class;
- ```respond_to?```: checks if an object has a given method.

**Note**: There's a special instance method, **method_missing**, that can be used to handle every method call made for methods that the class doesn't define.

```ruby
class Dummy
  def method_missing( name, *arguments, &block )
    "Class doesn't have any method '#{ name }()' defined!"
  end
end

Dummy.new.unknown()
```

**Note**: every class should override the method ```to_s()``` and provide a proper representation of itself.

> When we define top-level methods, we're actually creating ( private ) instance methods for class Object. Because top-level methods are private, you can't call them with an explicit receiver; you can only call them by using the implied receiver, self. That means self must be an object on whose method search path the given top-level method lies. But every object's search path includes the Kernel module, because the class Object mixes in Kernel, and every object's class has Object as an ancestor. That means you can always call any top-level method, wherever you are in your program. It also means you can never use an explicit receiver on a top-level method.

### 9.1.3. Method Overriding

> Method overriding, in object oriented programming, is a language feature that allows a subclass to provide a specific implementation of a method that is already provided by one of its ancestors. The implementation in the sub-class overrides ( replaces ) the implementation in the ancestor class.

### 9.1.4. Method Overloading

Ruby doesn't allow two different versions of a method with the same name - the last declaration prevails. The workaround for this is to handle a variable number of arguments, with logic inside the method that branches for each different version, depending on the number and type of arguments passed into the method.

### 9.1.5. Abstract Classes

Ruby allows a class to invoke certain methods that are not defined in its declaration. In this case the class is called an abstract class and delegates to its sub-classes the responsibility of declaring those methods.

### 9.1.6. Freezing Objects

- Mutable objects are objects whose state can change;
- Immutable objects are objects whose state never changes after creation.

Immutable objects have many desirable properties:

- Immutable objects are thread-safe. Threads cannot corrupt what they cannot change;
- Immutable objects make it easier to implement encapsulation. If part of an object's state is stored in an immutable object, then accessor methods can return that object to outside callers, without fear that those callers can change the object's state;
- Immutable objects make good hash keys, since their hash codes cannot change.

> In Ruby, Mutability is a property of an instance, not of an entire class. Any instance can become immutable by calling ```freeze()```.

It's possible to prevent an object from being changed, after it has been created. The ```Object.freeze()``` turns an object into a frozen instance. A frozen instance doesn't allow its instance variables to change value. To check if an object has been frozen there's the method ```Object.frozen?()```, which returns true if the object was already frozen and false otherwise.

> The ```Object.freeze()``` method prevents you from changing an object, effectively turning an object into a constant. After we freeze an object, an attempt to modify it results in **RuntimeError**.

### 9.1.7. self

> At every point when your program is running, there is one and only one self - the current or default object accessible to you in your program. You can tell which object self represents by following a small set of rules:

- **Top level context**: The top level context is before entering any other context, such as a class definition. Therefore the term top level refers to program code written outside of a class or module. Top-level methods are always private. Ruby provides a start-up self at the top level: **main**. It's a special term that the default self object uses to refer to itself. The class of the main object is Object;
- **Inside class and module**: self is the class or module object;
- **In instance method**: self inside this method will be some future object that has access to this method;
- **In singleton-method and class-method**: self is the object that owns the method. self inside a singleton method (a class method, in this case) is the object whose singleton method it is.

## 9.2. Interfaces / Modules

> Modules are a way of grouping together methods, classes, and constants. Modules have two major benefits:
- Modules provide a namespace and prevent name clashes;
- Modules implement the mixin facility.

> Modules define a namespace, a sandbox in which methods and constants can play without having to worry about being stepped on by other methods and constants.

Modules resemble classes but have some restrictions: modules can't create instances and can't have subclasses.

> Class names tend to be nouns, while module names are often adjectives.

```ruby
module [MODULE_NAME]
  ...
end
```

To access constants in a class or module one can use the **scope resolution operator**: "::".

> Whereas **include** mixes a module's methods in at the instance level ( allowing instances of a particular class to use the methods ), the **extend** keyword mixes a module's methods at the class level. This means that class itself can use the methods, as opposed to instances of the class.

```ruby
module [MODULE_NAME]
  ...
end

class [CLASS_NAME]
  extend [MODULE_NAME]
  ...
end
```

## 9.3. Mixins

> Ruby does not support multiple inheritance directly but Ruby Modules have another wonderful use. At a stroke, they pretty much eliminate the need for multiple inheritance, providing a facility called a _mixin_.

> Mixins give a wonderfully controlled way of adding functionality to classes. However, their true power comes out when the code in the mixin starts to interact with code in the class that uses it.

```ruby
module [MODULE_NAME]
  ...
end

class [CLASS_NAME]
  include [MODULE_NAME]
  ...
end
```

## 9.4. Garbage Collector

The memory model relies on a Garbage Collector ( GC ) to free objects from the heap. An object when created is store in the heap.

The GC, which is Ruby is of type **conservative mark-and-sweep**, starts by checking those objects that are no longer in use. If they are still used then they're marked as _to_keep_ else they're eligible for removal. It finishes by sweeping all objects in the heap and removing those marked as not _to_keep_.

## 9.5. Principles

### 9.5.1. Abstraction

### 9.5.2. Encapsulation

### 9.5.3. Inheritance

> Inheritance is a relation between two classes. We know that all cats are mammals, and all mammals are animals. The benefit of inheritance is that classes lower down the hierarchy get the features of those higher up, but can also add specific features of their own. If all mammals breathe, then all cats breathe.

- Use method ```super()``` from a method of a sub-class to call the method of same name in the super-class:
  - When invoked with no arguments then a message is sent to the parent of the current object, asking it to invoke a method of the same name as the method invoking super. It automatically forwards the arguments that were passed to the method from which it's called;
  - Called with an empty argument list it sends no arguments to the higher-up method, even if arguments were passed to the current method;
  - Called with specific arguments it sends exactly those arguments.
- An instance variable used by a subclass cannot _shadow_ an instance variable in the super-class. If a subclass uses an instance variable with the same name as a variable used by one of its ancestors, it will overwrite the value of its ancestor's variable.

**Note**: In Ruby, a class can only inherit from a single other class.

> The **BasicObject** class is the parent class of all classes in Ruby. Its methods are therefore available to all objects unless explicitly overridden. Prior to Ruby 1.9, **Object** class was the root of the class hierarchy. The new class BasicObject serves that purpose, and Object is a subclass of BasicObject. BasicObject is a very simple class, with almost no methods of its own. When you create a class in Ruby, you extend Object unless you explicitly specify the super-class, and most programmers will never need to use or extend BasicObject.

### 9.4.4. Polymorphism
