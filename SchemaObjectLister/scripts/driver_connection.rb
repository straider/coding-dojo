#!/usr/bin/env ruby
# encoding: UTF-8

class DriverConnection

  def initialize( database_configuration )
    puts 'Parsing DataBase configuration...'
    @db_driver = database_configuration[ 'driver'   ]
    @db_jar    = database_configuration[ 'jar'      ]
    @db_url    = database_configuration[ 'url'      ]
    @db_user   = database_configuration[ 'username' ]
    @db_pass   = database_configuration[ 'password' ]
  end

  def load_driver( vendors_folder )
    # XPTS419 - 2013.07.22: Should validate that file exists and is readable.
    puts "Loading #{ @db_driver } driver..."
    require vendors_folder + @db_jar
  end

  def connect
    # require 'logger'
    require 'sequel'

    puts "Connecting to #{ @db_url } with #{ @db_user }..."
    @connection = Sequel.connect( @db_url, :user => @db_user, :password => @db_pass )
    puts "Connected with #{ @connection.database_type } through #{ @connection.adapter_scheme }"
    if not @connection.test_connection then
      exit
    end

    # connection.loggers << Logger.new( $stdout )
    return @connection
  end

end
