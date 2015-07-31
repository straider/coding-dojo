coding-dojo / DataBaseInterface / Informix / Linux
==================================================

# 1. Overview

This short guide registers the research and the procedure to install a clean Python interpreter with modules to interface with an Informix engine, when the host is offline ( ie., does not have access to the Internet ).

# 2. Installation Steps

All these drivers are compliant with [DB API](# http://www.python.org/topics/database/DatabaseAPI-2.0.html
).

## 2.1. Pre-Requirements

- GCC;
- IBM Informix Client SDK: is installed and properly configured;
- All the required files have been downloaded and transfered to the folder $HOME/var/packages/:
  - [InformixDB 2.5](https://pypi.python.org/pypi/InformixDB/)
  - [JPype1 0.6.0](https://pypi.python.org/pypi/JPype1)
  - [JayDeBeApi 0.2.0](https://pypi.python.org/pypi/JayDeBeApi) for Python2 or [JayDeBeApi3 1.3](https://pypi.python.org/pypi/JayDeBeApi3) for Python3;
  - [zxJDBC 2.1](https://sourceforge.net/projects/zxjdbc/), which is [included with Jython 2.1 or greater](http://www.jython.org/archive/21/docs/zxjdbc.html).

A simple test is to execute the following shell script that uses **dbaccess**, replacing [INSTANCE] with a proper existing instance, such as **stores** ( Informix Sample Instance ):

```bash
#!/bin/env sh

dbaccess [INSTANCE] << END_OF_SQL
  SELECT  'Hello, World!' AS greet
  FROM    sysmaster:sysdual
END_OF_SQL
```

## 2.2. Python

Assuming that the tarball with sources exists in $HOME/var/packages/ then executing the following steps to install Python 2.7.10 in $HOME/opt/python:

```bash
# mkdir $HOME/tmp # If it does not exist.
pushd $HOME/tmp

export PYTHON_VERSION=2.7.10
export PYTHON_WHEELS=$HOME/opt/wheels
export PYTHONHOME=$HOME/opt/python
export PYTHONPATH=$PYTHON_WHEELS/lib/python2.7/site-packages
export PATH=$PYTHONHOME/bin:$PYTHON_WHEELS/bin:$PATH

tar -zxvf $HOME/var/packages/Python-$PYTHON_VERSION.tgz

cd $HOME/tmp/Python-$PYTHON_VERSION/
./configure --prefix=$HOME/opt/python-$PYTHON_VERSION
make && make install
ln -sf $HOME/opt/python-$PYTHON_VERSION/ $PYTHONHOME

popd

python --version
```

The end result should be similar to:

```
Python 2.7.10
```

## 2.3. Eggs / Wheels

Assuming that the required tarballs exist in $HOME/var/packages/ then executing the following steps to install Python Eggs / Wheels.

### 2.3.1. InformixDB

```bash
pushd $HOME/tmp

tar -zxvf $HOME/var/packages/setuptools-18.0.1.tar.gz
tar -zxvf $HOME/var/packages/InformixDB-2.5.tar.gz

mkdir -p $PYTHON_WHEELS/lib/python2.7/site-packages/
cd $HOME/tmp/setuptools-18.0.1
python setup.py build
python setup.py install --prefix=$PYTHON_WHEELS/

cd $HOME/tmp/InformixDB-2.5
python setup.py build
python setup.py install --prefix=$PYTHON_WHEELS/

popd
```

Validate by executing the following Python script:

```python
#!/bin/env python

import sys
import informixdb

dsn      = '[SCHEMA]';
username = '[USERNAME]';
password = '[PASSWORD]';
query    = r"SELECT 'Hello, World!' FROM sysmaster:sysdual";

try :
  connection = informixdb.connect( dsn, username, password )

  cursor = connection.cursor()
  cursor.execute( query )

  for row in cursor :
     print '%s' % ( row[ 0 ] )

  connection.close()
except informixdb.Error, exception :
  print exception

sys.exit( 0 );
```

### 2.3.2. ibm_db

**Note**: The driver **ibm_db** requires the installation of **IBM Data Server Driver for ODBC and CLI**.

```bash
pushd $HOME/tmp

tar -zxvf $HOME/var/packages/ibm_db-2.0.5.1.tar.gz
tar -xvf $HOME/var/packages/linuxx64_odbc_cli.tar -C $HOME/opt
export IBM_DB_HOME=$HOME/opt/clidriver
export IBM_DB_LIB=$HOME/opt/clidriver/lib
export PATH=$IBM_DB_HOME/bin:$PATH
export LD_LIBRARY_PATH=$IBM_DB_LIB:$LD_LIBRARY_PATH
# Create db2cli.ini in $HOME/opt/clidriver/cfg
db2cli validate -dsn valor_dsv_1
db2cli validate -dsn valor_dsv_1 -connect

cd $HOME/tmp/ibm_db-2.0.5.1
python setup.py build
python setup.py install --prefix=$PYTHON_WHEELS/

popd
```

Validate by executing the following Python script:

```python
#!/bin/env python

import sys
import ibm_db_dbi

dsn      = '[SCHEMA]@[INSTANCE]'
username = '[USERNAME]';
password = '[PASSWORD]';
query    = r"SELECT 'Hello, World!' FROM sysmaster:sysdual"

try :
  connection = ibm_db_dbi.connect( dsn, username, password )

  cursor = connection.cursor()
  cursor.execute( query )

  for row in cursor.fetchall() :
     print '%s' % ( row[ 0 ] )

  connection.close()
except ibm_db_dbi.Error, exception :
  print exception

sys.exit( 0 );
```

### 2.3.3. JayDeByApi

```bash
pushd $HOME/tmp

tar -zxvf $HOME/var/packages/JPype1-0.6.0.tar.gz
tar -zxvf $HOME/var/packages/JayDeBeApi-0.2.0.tar.gz

cd $HOME/tmp/JPype1-0.6.0
python setup.py build
python setup.py install --prefix=$PYTHON_WHEELS/

cd $HOME/tmp/JayDeBeApi-0.2.0
python setup.py build
python setup.py install --prefix=$PYTHON_WHEELS/

popd
```

Validate by executing the following Python script:

```python
#!/bin/env python

import sys
import jaydebeapi

driver   = 'com.informix.jdbc.IfxDriver'
hostname = '[HOSTNAME]'
port     = [PORT]
server   = '[INSTANCE]'
schema   = '[SCHEMA]';
url      = 'jdbc:informix-sqli://%s:%d/%s:informixserver=%s' % ( hostname, port, schema, server )
username = '[USERNAME]'
password = '[PASSWORD]'
jar      = '[CLASSPATH_FOR_INFORMIX_JDBC_DRIVER]/ifxjdbc.jar'
query    = r"SELECT 'Hello, World!' FROM sysmaster:sysdual"

try :
  connection = jaydebeapi.connect( driver, [ url, username, password ], jar )

  cursor = connection.cursor()
  cursor.execute( query )

  for row in cursor.fetchall() :
     print '%s' % ( row[ 0 ] )

  connection.close()
except jaydebeapi.Error, exception :
  print exception

sys.exit( 0 );
```

### 2.3.4. zxJDBC

It's part of Jython, since version 2.1, and as such the installation can be validated with the following Python script:

```python
#!/bin/env python

from __future__ import with_statement
from com.ziclix.python.sql import zxJDBC
import sys

driver   = 'com.informix.jdbc.IfxDriver'
hostname = '[HOSTNAME]'
port     = [PORT]
server   = '[INSTANCE]'
schema   = '[SCHEMA]';
url      = 'jdbc:informix-sqli://%s:%d/%s:informixserver=%s' % ( hostname, port, schema, server )
username = '[USERNAME]'
password = '[PASSWORD]'
query    = r"SELECT 'Hello, World!' FROM sysmaster:sysdual"

try :
  with zxJDBC.connect( url, username, password, driver ) as connection :
    with connection :
      with connection.cursor() as cursor :
        cursor.execute( query )

        for row in cursor.fetchall() :
           print '%s' % ( row[ 0 ] )
except zxJDBC.Error, exception :
  print exception

sys.exit( 0 );
```
