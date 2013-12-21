#!/usr/bin/env ruby
require 'rubygems'  # not necessary for Ruby 1.9
require 'mongo'
include Mongo

mongo_client = MongoClient.new("localhost", 27017)
