#!/usr/bin/env ruby
#
class Dog
    def set_name( aName )
        @myname = aName
    end

    def get_name
        return @myname
    end

    def talk
        return @myname
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

# ---- Create instances (objects) of the Dog and Cat Class
mydog = Dog.new
yourdog = Dog.new
mycat = Cat.new
yourcat = Cat.new
someotherdog = Dog.new

# -- Name them
yourdog.set_name( 'Fido' )
yourdog.set_name( 'Bonzo' )
mycat.set_name( 'Tiddles' )
yourcat.set_name( 'Flossy' )

# -- Get their names and display them
# Dogs
# p(mydog.get_name)
# p(yourdog.get_name)
# # hmm, but what happens here if the dog has no name?
p(someotherdog.get_name)

# Cats
p(mycat.get_name)
p(yourcat.get_name)

# ---- Ask them to talk
p(mydog.talk)
p(yourdog.talk)





