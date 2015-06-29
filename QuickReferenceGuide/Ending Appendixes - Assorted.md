Quick Reference Guide
=====================

# 11. Core Packages / Standard Library

## 11.1 BigDecimal

## 11.2. File Handling / Input-Output

- ```File.open( [FILENAME], [MODE:ENCODINGS] )``` creates a file handler to a file.
- Modes can be:
  - r: read mode;
  - r+: read / write mode;
  - w: write mode, truncates or creates a file.
- ```File.open()``` opens a new File if there is no associated block. If the optional block is given, it will be passed file as an argument, and the file will automatically be closed when the block terminates;
- A file pointer indicates the current location in the file;
- The ```IO.read()``` method opens the file, optionally seeks to the given offset, and then returns length bytes (defaulting to the rest of the file), ensuring that the file is closed before returning;
- The Find module supports top-down traversal of a set of file paths, given as arguments to the ```Find.find()``` method;

```ruby
require 'find'

Find.find( './' ) do | file |
  type = case
         when File.file?( file ) then 'F'
         when File.directory?(file) then "D"
         else '?'
         end
  puts "#{ type }: #{ file }"
end
```

Random access to the file is performed using one of the following constants:
- SEEK_CUR: Seeks to first integer number parameter plus current position;
- SEEK_END: Seeks to first integer number parameter plus end of stream;
- SEEK_SET: Seeks to the absolute location given by first integer number parameter

**Note**: when seeking from the end of the stream one should use negative number parameter.

```ruby
filename = 'test.tmp'
open( filename, 'w:UTF-8' ) { | file | file << "Here's\nsome output.\n" }
status = File.stat( filename )
status.ctime
status.atime
status.mtime
path = File.new( filename, 'r' ).path
```

## 11.3. Random Numbers

- Ruby comes with a random number generator;
- The method to get a randomly chosen number is ```rand()```;
- Calling ```rand()``` without arguments returns a float greater than or equal to 0.0 and less than 1.0;
- Calling ```rand( [VALUE] )``` will return an integer value greater than or equal to 0 and less than [VALUE].

## 11.4. Date and Time

> The **Time** class in Ruby has a powerful formatting function which can help represent the time in a variety of ways. The Time class contains Ruby's interface to the set of time libraries written in C. Time zero for Ruby is the first second GMT of January 1, 1970.

```ruby
Time.now
```

> Ruby's **DateTime** class is superior to Time for astronomical and historical applications.

```ruby
require 'time'

DateTime.now
```

## 11.5. Regexp

Regular Expressions are used for pattern matching and pattern substitution, usually with large amounts of text. A regular expression is a way to specify a pattern of characters to be matched against a string. A regular expression is created by writing the pattern between slash "/" character and becomes an instance of **Regexp**.

```ruby
/Ruby/.class

regexp = /Ruby/
string = 'Ruby is a great language!'

match1 = regexp.match( string )
match2 = string =~ regexp

match1.class
match2.class
```

The ```match()``` method returns an instance of **MatchData** when there's a match, nil otherwise, while the ```=~``` operator returns the index number of the string where the match starts, nil otherwise.

For more information, visit the site [Using Regular Expressions with Ruby](http://www.regular-expressions.info/ruby.html).

## 11.6. Serialization / Marshalling

- ```Marshal.dump()``` can be used to save a serialized version of an instance to a file;
- ```Marshal.load()``` can be used to read a serialized version of an instance from a file.

> Marshal only serializes data structures. It can't serialize Ruby code ( like Proc objects ) or resources allocated by other processes ( like file handles or database connections ). Marshal just gives you an error when you try to serialize a file.

## 11.7. Testing

## 11.8. Benchmarking

Ruby provides Benchmark for timing code.

```ruby
require "benchmark"

Benchmark.bm do | benchmark |
  benchmark.report( 'Benchmark A' ) do
    1000.times { ... }
  end
  benchmark.report( 'Benchmark B' ) do
    1000.times { ... }
  end
end
```

## 11.8. Logging

> The **Logger** class in the Ruby standard library, helps write log messages to a file or stream. It supports time- or size-based rolling of log files. Messages can be assigned severities, and only those messages at or above the logger's current reporting level will be logged.

```ruby
require 'logger'

$LOG = Logger.new( 'monthly.log', 'monthly' ) # Keep data for the current month only
$LOG = Logger.new( 'daily.log', 20, 'daily' ) # # Keep data for today and the past 20 days.
$LOG = Logger.new( 'application.log', 0, 100 * 1024 * 1024 ) # # Start the log over whenever the log exceeds 100 megabytes in size.

$LOG.level = Logger::DEBUG
$LOG.level = Logger::INFO
$LOG.level = Logger::ERROR
```

# 12. Gems

## 12.1. SQL

## 12.2. Networking

## 12.3. Concurrency
