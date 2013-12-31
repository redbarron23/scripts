# Ruby Sample program from www.sapphiresteel.com

class MyClass
	def saysomething
		puts( "Hello" )
	end
end

# saysomething # <= This method above cannot be called this way!
ob = MyClass.new
ob.saysomething