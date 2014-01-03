#!/usr/bin/env ruby
#
# Thing Class has no :wq! intialised method
class Thing
    def set_name( aName )
        @name = aName
    end

    def get_name
        return @name
    end
end



