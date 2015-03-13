#!/usr/bin/env ruby
# encoding: UTF-8

# XPTS419 - 2013.07.23: Should extend from LoadedModel ( Sequel::Model ) :?:
class SchemaObjectLister

  def initialize( connection )
    @connection = connection
  end

  def get_objects
    objects = Array.new
    objects += @connection.tables
    objects += @connection.views
    # objects += @connection.indexes
    # objects += @connection.foreign_key_list
  end

  def describe( table )
    info = ""
    @connection.schema( table ).each do | column |
      info += "  Column Name: #{ column[ 0 ] }"                     + "\n"
      info += "    Type        = #{ column[ 1 ][ :db_type      ] }" + "\n"
      info += "    RubyType    = #{ column[ 1 ][ :type         ] }" + "\n"
      info += "    PrimaryKey  = #{ column[ 1 ][ :primary_key  ] }" + "\n"
      info += "    Default     = #{ column[ 1 ][ :default      ] }" + "\n"
      info += "    RubyDefault = #{ column[ 1 ][ :ruby_default ] }" + "\n"
      info += "    AllowNull   = #{ column[ 1 ][ :allow_null   ] }" + "\n"
    end

    return info
  end

end

puts 'Started...'

puts 'Including Java features...'
include Java
require 'rubygems'

CURRENT_SCRIPT_PATH = File.expand_path( File.dirname( __FILE__ ) ) unless defined?( CURRENT_SCRIPT_PATH )
require CURRENT_SCRIPT_PATH + '/configurator'
require CURRENT_SCRIPT_PATH + '/driver_connection'

# XPTS419 - 2013.07.22: What if no argument passed? Should output Usage and TerminateAbnormally ( thus avoiding TypeError: can't convert nil into String ).
configuration_file = ARGV[ 0 ]
configuration      = Configurator.new( configuration_file )

driver = DriverConnection.new( configuration.database )
driver.load_driver( configuration.folders[ 'vendors' ] )
connection = driver.connect
puts "DataBase Type: #{ connection.database_type }"

lister = SchemaObjectLister.new( connection )
number_of_objects = lister.get_objects.size
puts "There are #{ number_of_objects } objects in schema"

if number_of_objects > 0 then
  puts
  # connection.transaction do
    lister.get_objects.each do | object_name |
      puts "  Object Name: #{ object_name }"
    end
  # end

  puts
  puts "First Object MetaData: #{ lister.get_objects.first }"
  puts lister.describe( lister.get_objects.first )
end
connection.disconnect

puts 'Finished.'
