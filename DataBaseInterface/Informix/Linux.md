coding-dojo / DataBaseInterface / Informix / Linux
==================================================

# 1. Overview

This short guide registers the research and the procedure to install a clean Perl interpreter with modules to interface with an Informix engine, when the host is offline ( ie., does not have access to the Internet ).

# 2. Installation Steps

## 2.1. Pre-Requirements

- GCC;
- IBM Informix Client SDK: is installed and properly configured;
- All the required files have been downloaded and transfered to the folder $HOME/var/packages/:
  - [Perl 5.22.0](http://www.cpan.org/src/README.html)
  - [Test::Pod 1.51](https://metacpan.org/release/Test-Pod)
  - [Net::Daemon 0.48](https://metacpan.org/release/Net-Daemon)
  - [PlRPC 0.2020](https://metacpan.org/release/PlRPC)
  - [DBI 1.633](https://metacpan.org/release/DBI)
  - [ExtUtils::MakeMaker 6.98](https://metacpan.org/release/ExtUtils-MakeMaker): it's necessary to downgrade for DBD::Informix to build
  - [DBD::Informix 2013.0521](https://metacpan.org/release/DBD-Informix)

A simple test is to execute the following shell script that uses **dbaccess**, replacing [INSTANCE] with a proper existing instance, such as **stores** ( Informix Sample Instance ):

```bash
#!/bin/env sh

dbaccess [INSTANCE] << END_OF_SQL
  SELECT  'Hello, World!' AS greet
  FROM    sysmaster:sysdual
END_OF_SQL
```

## 2.2. Perl

Assuming that the tarball with sources exists in $HOME/var/packages/ then executing the following steps to install Perl 5.22.0 in $HOME/opt/perl:

```bash
# mkdir $HOME/tmp # If it does not exist.
pushd $HOME/tmp

export PERL_VERSION=5.22.0
export PERL_ARCH=x86_64-linux-thread-multi # Configure this to match environment.
export PERL_MODULES=$HOME/opt/modules
export PERL5LIB=$PERL_MODULES/lib/$PERL_VERSION:$PERL_MODULES/lib/$PERL_VERSION/$PERL_ARCH:$PERL_MODULES/lib/site_perl/$PERL_VERSION:$PERL_MODULES/lib/site_perl/$PERL_VERSION/$PERL_ARCH
export PATH=$HOME/opt/perl/bin:$PERL_MODULES/bin:$PATH

tar -zxvf $HOME/var/packages/perl-$PERL_VERSION.tar.gz
cd $HOME/tmp/perl-$PERL_VERSION
sh Configure -Dusethreads -des -Dprefix=$HOME/opt/perl-$PERL_VERSION
make && make test && make install

ln -sf $HOME/opt/perl-$PERL_VERSION/ $HOME/opt/perl

popd

perl --version
```

The end result should be similar to:

```
This is perl 5, version 22, subversion 0 (v5.22.0) built for x86_64-linux-thread-multi
```

## 2.3. Modules

Assuming that the required tarballs exist in $HOME/var/packages/ then executing the following steps to install Perl Modules.

### 2.3.1. DBI

```bash
pushd $HOME/tmp

tar -zxvf $HOME/var/packages/Test-Pod-1.51.tar.gz
tar -zxvf $HOME/var/packages/Net-Daemon-0.48.tar.gz
tar -zxvf $HOME/var/packages/PlRPC-0.2020.tar.gz
tar -zxvf $HOME/var/packages/DBI-1.633.tar.gz

cd $HOME/tmp/Test-Pod-1.51
perl Makefile.PL PREFIX=$PERL_MODULES/
make && make test && make install

cd $HOME/tmp/Net-Daemon-0.48
perl Makefile.PL PREFIX=$PERL_MODULES/
make && make test && make install

cd $HOME/tmp/PlRPC
perl Makefile.PL PREFIX=$PERL_MODULES/
make && make test && make install

cd $HOME/tmp/DBI-1.633
perl Makefile.PL PREFIX=$PERL_MODULES/
make && make test && make install

popd
```

### 2.3.2. DBD::Informix

```bash
pushd $HOME/tmp

tar -zxvf $HOME/var/packages/ExtUtils-MakeMaker-6.98.tar.gz # Downgrade required to build DBD::Informix.
tar -zxvf $HOME/var/packages/DBD-Informix-2013.0521.tar.gz

cd $HOME/tmp/ExtUtils-MakeMaker-6.98
perl Makefile.PL PREFIX=$PERL_MODULES/
make && make test && make install

export DBI_DBNAME=[INSTANCE]              # $DBI_DBNAME unset - defaulting to 'stores'.
export DBD_INFORMIX_DATABASE=[SCHEMA1]    # $DBD_INFORMIX_DATABASE unset - defaulting to 'stores'.
export DBD_INFORMIX_DATABASE2=[SCHEMA2]   # $DBD_INFORMIX_DATABASE2 unset - defaulting to 'stores'.
export DBD_INFORMIX_USERNAME=[USERNAME1]  # $DBD_INFORMIX_USERNAME is unset.
export DBD_INFORMIX_USERNAME2=[USERNAME2] # $DBD_INFORMIX_USERNAME2 is unset.
export DBD_INFORMIX_PASSWORD=[PASSWORD1]  # $DBD_INFORMIX_PASSWORD is unset.
export DBD_INFORMIX_PASSWORD2=[PASSWORD2] # $DBD_INFORMIX_PASSWORD2 is unset.
cd $HOME/tmp/DBD-Informix-2013.0521
export DBD_INFORMIX_NO_ESQLTEST=yes # Can be comment out, but it's a best pratice to validate E/SQL is working.
perl Makefile.PL PREFIX=$PERL_MODULES/
export DBD_INFORMIX_NO_RESOURCE=yes # Comment out if has RESOURCE role.
export DBD_INFORMIX_NO_DBCREATE=yes # Comment out if can create schema role.
make && make test && make install

popd
```

Validate by executing the following Perl script:

```perl
#!/bin/env perl

use strict;
use warnings;
use Data::Dumper;
use DBI;

print Dumper( DBI->available_drivers );
print Dumper( DBI->data_sources( 'Informix' ) );

my $dsn      = 'DBI:Informix:[SCHEMA]';
my $username = '[USERNAME]';
my $password = '[PASSWORD]';
my $query    = qq/SELECT 'Hello, World!' AS greet FROM sysmaster:sysdual/;

my $dbh = DBI->connect( $dsn                
                      , $username           
                      , $password           
                      , { RaiseError => 1
                        # https://metacpan.org/pod/DBI#AutoCommit
                        # Commented out if Informix is working in NoLogging mode ( without transactions ).
                        # , AutoCommit => 0
                        }                 
                      )                   or die "Couldn't connect to database: " . DBI->errstr;
my $sth = $dbh->prepare( $query )         or die "Couldn't prepare statement: " . $dbh->errstr;     
$sth->execute()                           or die "Couldn't execute statement: " . $sth->errstr;

my @row;
while ( @row = $sth->fetchrow_array ) {
  print join( ', ', @row ), "\n";
}

$sth->finish;
$dbh->disconnect;
```

### 2.3.3. DBD::JDBC Proxy

### 2.3.4. non-DBI JDBC
