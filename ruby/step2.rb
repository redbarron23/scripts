#!/usr/bin/env ruby
#
class TalkingThing
    def saysomething
        puts "Hello"
    end
end

ob1 = TalkingThing.new
ob2 = TalkingThing.new
print "ob1 says..."
ob1.saysomething
print "ob2 says..."
print ob2.saysomething
print "Class of ob1 is: "
puts ob1.class
print "Class of ob2 is: "
puts ob2.class
