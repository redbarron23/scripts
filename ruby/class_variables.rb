#!/usr/bin/env ruby
#
# illustrate how to creating descendent objects
#  reading and writing attributes
#  object (instance) variables
#  class variables
#
   # Thing
   class Thing
       @@num_things = 0 # class variable

       attr_reader( :name, :description )
       attr_writer( :description )

       def initialize( aName, aDescription )
           @name = aName
           @description = aDescription
           @@num_things +=1 # increment @@num_things
       end

       def to_s # override default to_s method
           return "(Thing.to_s):: The #{@name} Thing is #{@description}"
        end

       def show_classvars
           return "Ther are #{@@num_things} Thing objects in this game
