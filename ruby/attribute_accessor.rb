#!/usr/bin/env ruby

# explicit read and write
#class Thing
#    attr_reader :description
#    attr_writer :description
#end

# create both get and set accessor
class Thing
    attr_accessor(:name, :description)
end

t1.name = "A Thing object"
t1.description = "a furry wotsit"
puts("#{t1.name} is #{t1.description}")
