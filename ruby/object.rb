#!/usr/bin/env ruby
#
class MyClass
    def saysomething
        puts( "Hello" )
    end
end

# sayssomething # This method above cannot be called this way
ob = MyClass.new
ob.saysomething
