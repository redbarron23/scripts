#!/usr/bin/env ruby

#puts "hello world"

localvar = "hello"
$globalvar = "goodbye"

def amethod
	localvar = 10
	puts( localvar )
	puts( $globalvar )
end

def anotherMethod
	localvar = 500
	$globalvar = "bonjour"
	puts ( localvar )
	puts ( $globalvar )
end


amethod            #=> localvar = 10
anotherMethod      #=> localvar = 500
amethod            #=> localvar = 10
puts( localvar)    #=> localvar = "hello"

#amethod            #=> $globalvar = "goodbye"
#anotherMethod      #=> $globalvar = "bonjour"
#amethod            #=> $globalvar = "bonjour"
#puts( $globalvar ) #=> $globalvar = "bonjour"
