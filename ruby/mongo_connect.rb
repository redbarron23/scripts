#!/usr/bin/env ruby
#require 'rubygems'
#require 'mongo'
include Mongo

@client = MongoClient.new('localhost', 27017)
@db     = @client['badgeville_productionb']
@users   = @db['userst']


puts "There are #{@users.count} records. Here they are:"

