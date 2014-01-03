#!/usr/bin/env ruby

# no args
def showstring
    puts( "Hello")
end

# one arg
def showname( aName )
    puts( "Hello #{aName}" )
end

# two args
def return_name( aFirstName, aSecondName )
    return "Hello #{aFirstName} #{aSecondName}"
end

showstring
showname ( "Fred" )
puts( return_name( "Mary Mary", "Quite-Contrary" ) )
puts( return_name( "Little Jack", "Horner" ) )
