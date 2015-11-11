Quick Reference Guide
=====================

# 5. Collection Types

## 5.1. Structs

### 5.1.1 Operators

## 5.2. Arrays, Lists and Sets

> Enumerated data types are user-defined data types. They allow values to be specified in a list. Only assignment operators and relational operators are permitted on enumerated data type. The order in which the items are listed in the domain of an enumerated type defines the order of the items. Enumerated data types can be declared as follows:

```pascal
type
  enumeratedIdentifier = ( item1, item2, item3, ... );
```

**Note**: The domain of enumerated type identifiers cannot consist of numeric or character constants.

### 5.2.1 Operators

## 5.3. Hashes, Maps or Dictionaries

### 5.3.1 Operators

## 5.4. Ranges

> Subrange types allow a variable to assume values that lie within a certain range. Syntax for declaring a subrange type is as follows:

```pascal
type
  subrangeIdentifier = lowerLimit ... upperLimit;
```

> Subrange types can be created from a subset of an already defined enumerated type, For example:

```pascal
type
months = ( Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec );
Summer = Apr ... Aug;
Winter = Oct ... Dec;
```

### 5.4.1 Operators

## 5.5. Slices

### 5.5.1 Operators

## 5.6. Tuples

### 5.6.1 Operators

## 5.7. Regexp

### 5.7.1 Operators
