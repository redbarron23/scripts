#!/usr/bin/env ruby

require "rubygems"
require "resque"
require "optparse"

options  = {}
required = [:warning, :critical, :host, :queues]

parser   = OptionParser.new do |opts|
  opts.banner = "Usage: check_resque [options]"
  opts.on("-h", "--host redishost", "The hostname of the redis server") do |h|
    options[:host] = h
  end
  opts.on("-n", "--namespace resque:namespace", "The resque namespace") do |n|
    options[:namespace] = n
  end
  opts.on("-q", "--queues low,medium,high", "The queues to check (comma separated)") do |q|
    options[:queues] = q
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
  values = options[:queues].split(",").inject({}) do |memo, queue|
    memo[queue] = Resque.size(queue)
    memo
  end

  status = :ok

  if values.any? { |k,v| v >= options[:critical].to_i }
    status = :critical
  elsif values.any? { |k,v| v >= options[:warning].to_i }
    status = :warning
  end

  print status.to_s.upcase
  print " - "
  puts values.map { |k,v| "#{k}: #{v}" }.join("; ")

  if (status == :critical)
    exit(2)
  elsif status == :warning
    exit(1)
  end
end
