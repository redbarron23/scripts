#!/usr/bin/env ruby

def showstring
    puts( "Hello")
end

def showname( aName )
    puts( "Hello #{aName}" )
end

def return_name( aFirstName, aSecondName )
    return "Hello #{aFirstName} #{aSecondName}"
end

showstring
showname ( "Fred" )
puts( return_name( "Mary Mary", "Quite-Contrary" ) )
puts( return_name( "Little Jack", "Horner" ) )
