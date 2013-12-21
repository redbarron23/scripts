#!/usr/bin/env ruby

require "rubygems"
require "resque"
require "resque/failure/redis"
require "optparse"

options  = {}
required = [:warning, :critical, :host]

parser   = OptionParser.new do |opts|
  opts.banner = "Usage: check_resque_failed [options]"
  opts.on("-h", "--host redishost", "The hostname of the redis server") do |h|
    options[:host] = h
  end
  opts.on("-n", "--namespace resque:namespace", "The resque namespace") do |n|
    options[:namespace] = n
  end
  opts.on("-w", "--warning percentage", "Warning threshold") do |w|
    options[:warning] = w
  end
  opts.on("-c", "--critical critical", "Critical threshold") do |c|
    options[:critical] = c
  end
end
parser.parse!

if !required.all? { |k| options.has_key?(k) }
  abort parser.to_s
else
  redis = Redis.new(:host => options[:host])
  Resque.redis = redis
  Resque.redis.namespace = options[:namespace]
  count = Resque::Failure::Redis.count

  status = :ok
  if count >= options[:critical].to_i
    status = :critical
  elsif count >= options[:warning].to_i
    status = :warning
  end

  print status.to_s.upcase
  print " - "
  puts "failed: #{count}"

  if (status == :critical)
    exit(2)
  elsif status == :warning
    exit(1)
  end
end
