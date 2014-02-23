#!/usr/bin/env ruby
#
IO.popen ("date") { |f| puts f.gets }

