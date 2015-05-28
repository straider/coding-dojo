Quick Reference Guide
=====================

# 11. Core Packages / Standard Library

## 11.1 BigDecimal

> Package big implements multi-precision arithmetic (big numbers). The following numeric types are supported:
- **Int**: big signed integers;
- **Rat**: rational numbers.

## 11.2. File Handling / Input-Output

## 11.3. Random Numbers

## 11.4. Date and Time

## 11.5. Regexp

## 11.6. Testing

## 11.7. Benchmarking

## 11.8. Logging

> Package log implements a simple logging package. It defines a type, **Logger**, with methods for formatting output. It also has a predefined _standard_ Logger accessible through helper functions:
- ```Print( f | ln )```: writes to standard error and prints the date and time of each logged message;
- ```Fatal( f | ln )```: calls ```os.Exit( 1 )``` after writing the log message;
- ```Panic( f | ln)```: calls **panic** after writing the log message.

# 12. 3rd party Libraries / Packages

## 12.1. SQL

## 12.2. Networking

## 12.3. Concurrency

# 13. Go Tool

## 13.1. gofmt

## 13.2. govet

## 13.3. golint

## 13.4. goimports
