# Ruby Sample program from www.sapphiresteel.com 
# Create classes and use instance variables such as @myname

class Dog   
	def set_name( aName )
		@myname = aName
	end
	
	def get_name
		 return @myname
	end
	
	def talk
		return 'woof!'
	end
end


class Cat  
	def set_name( aName )
		@myname = aName
	end
	
	def get_name
		return @myname
	end
	
	def talk
		return 'miaow!'
	end
end


# --- Create instances (objects) of the Dog and Cat classes
mydog = Dog.new
yourdog = Dog.new
mycat = Cat.new
yourcat = Cat.new
someotherdog = Dog.new

# --- Name them
mydog.set_name( 'Fido' )
yourdog.set_name( 'Bonzo' )
mycat.set_name( 'Tiddles' )
yourcat.set_name( 'Flossy' )


# --- Get their names and display them
# Dogs
p(mydog.get_name)
p(yourdog.get_name)
# hmmm, but what happens here if the dog has no name?
p(someotherdog.get_name)
# Cats
p(mycat.get_name)
p(yourcat.get_name)

# --- Ask them to talk
p(mydog.talk)
p(yourdog.talk)
p(mycat.talk)
p(yourcat.talk)

# --- So what is nil anyway? - you can use the class method to find out
p(mydog.get_name.class)				# this dog has a name
p(someotherdog.get_name.class)		# this one doesn't