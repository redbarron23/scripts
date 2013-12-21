#!/usr/bin/ruby 
require 'rubygems'
require 'chronic'

##################
# Global vars
##################
host = "puppetmaster"
#host = "puppet"
port = '27017'
db_name = 'badgeville_production'
tmp_dir = '/var/nfs'
mongodump = '/usr/bin/mongodump'
mongoexport = '/usr/bin/mongoexport'
mongorestore = '/usr/bin/mongorestore'
mongoimport = '/usr/bin/mongoimport'

# I need to test this out (right now hard-coding)
#dateint = Chronic.parse('eleven days ago midnight').to_i
#time = Chronic.parse('one days ago midnight')
date_begin = 1372489200   # Human time (GMT): Sat, 29 Jun 2013 00:00:00 GMT
date_end =   1373439600  # Human time (GMT): Wed, 10 Jul 2013 00:00:00 GMT



#"" Examples of date to epoch
# from python
# >>> import datetime
# >>> datetime.datetime(2013,06,29,0,0,0).strftime('%s')
# '1372489200'
# >>> datetime.datetime(2013,07,10,0,0,0).strftime('%s')
# '1373439600'
# >>> 


### from confirm mongo shell (need to add last 000 for millisecond)
#
#> new Date(1372489200000)
#ISODate("2013-06-29T07:00:00Z")



##################
# Collection Arrays
##################
dump_collections_updated = [ 'activity_definitions', 'contents', 'api_keys', 'components', 'contextual_streams', 'groups', 'leaderboards', 'networks', 'reward_definitions', 'site_contents', 'sites', 'social_networks', 'style_sets', 'tracks', 'units', 'users' ]

dump_collections_created = [ 'activities', 'rewards' ]


##################
# Loop thru Arrays
# and dump
##################
#dump_collections_created.each do |col|
#       #cmd = "#{mongodump} --host #{host} --port #{port} -d #{db_name} -c #{col} -o #{tmp_dir} --query '{ \"created_at\" : { $gte : new Date(#{date_begin}000), $lte : new Date(#{date_end}000) } }'"
#       cmd = "#{mongodump} --host #{host} --port #{port} -d #{db_name} -c #{col} -o #{tmp_dir} --query '{ \"created_at\" : { $gte : new Date(#{date_begin}000), $lte : new Date(#{date_end}000) } }'"
#       puts `#{cmd}`
#  end

#dump_collections_updated.each do |col|
     #cmd = "#{mongodump} --host #{host} --port #{port} -d #{db_name} -c #{col} -o #{tmp_dir} --query '{ \"updated_at\" : { $gte : new Date(#{date_begin}000), $lte : new Date(#{date_end}000) } }'"
#     cmd = "#{mongodump} --host #{host} --port #{port} -d #{db_name} -c #{col} -o #{tmp_dir} --query '{ \"updated_at\" : { $gte : new Date(#{date_begin}000), $lte : new Date(#{date_end}000) } }'"
#     puts `#{cmd}`
#  end

# cmd2 = "#{mongoexport} --host #{host} --port #{port} -d #{db_name} -o #{tmp_dir}/badgeville_production/players.json -c players --query '{ \"updated_at\" : { $gte : new Date(#{dateint}000), $lte : new Date(#{date_end}000) } }'"

################################
# MongoExport players w/ upsert
################################
#cmd2 = "#{mongoexport} --host #{host} --port #{port} -d #{db_name} -o #{tmp_dir}/players.json -c players --query '{ \"updated_at\" : { $gte : new Date(#{date_begin}000), $lte : new Date(#{date_end}000) } }'"
#      puts "Running '#{cmd2}'"
#      puts `#{cmd2}`


################################
# MongoRestore BSON files
################################
Dir.glob('/nfs/badgeville_production/*.bson') do |bson_file|
  # do work on files ending in .bson in the desired directory
  #puts "working on: #{bson_file}..."
  cmd3 = "#{mongorestore} --db badgeville_production #{bson_file} --keepIndexVersion"
  puts "'#{cmd3}'"
  puts `#{cmd3}`
end

################################
# MongoImport Players JSON file
################################
cmd4 = "#{mongoimport} --host #{dest_host} --db badgeville_production --upsert -c players #{path_base}/#{dump_dir}/players.json"
puts "Running import upsert on players: '#{cmd4}'"
puts `#{cmd4}`
