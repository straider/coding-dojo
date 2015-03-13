#!/usr/bin/env ruby
# encoding: UTF-8

class Configurator

  attr_reader :folders
  attr_reader :database

  def initialize( configuration_file )
    require 'json'

    # XPTS419 - 2013.07.22: Should validate that file exists and is readable.
    puts "Reading configuration from #{ configuration_file }..."
    configuration = JSON.parse( IO.read( configuration_file ) )

    # XPTS419 - 2013.07.22: How to validate that each sub-configuration is complete ( json schema validator )?
    @folders  = configuration[ 'folders'  ]
    @database = configuration[ 'database' ]
  end

end
