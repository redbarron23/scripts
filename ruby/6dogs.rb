#!/usr/bin/ruby

=begin
class definition begins with the keyword class (all lowercase) and the name of the class itself, 
which must begin with an uppercase letter. The class contains a method called set_name. 
This takes an incoming argument, aName. 
The body of the method assigns the value of aName to a variable called @myname.
=end

class Dog
	def set_name ( aName )
		@myname = aName
	end

	def get_name
		return @myname
	end

	def talk
		return 'woof'
	end
end


mydog = Dog.new
#yourdog = Dog.new

mydog.set_name( 'Fido' )
#yourdog.set_name( 'Bonzo' )

puts(mydog.get_name)
puts(mydog.talk)
