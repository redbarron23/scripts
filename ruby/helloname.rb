#!/usr/bin/env ruby
print('Enter your name: ')

name = gets()
# Single quotes does not interpolates variable
#puts( 'Hello #{name}' )

# Double quotes interpolates variable
puts( "Hello #{name}" )


