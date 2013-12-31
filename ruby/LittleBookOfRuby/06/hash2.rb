# Ruby Sample program from www.sapphiresteel.com 

h1 = {'key1'=>'val1', 'key2'=>'val2', 'key3'=>'val3', 'key4'=>'val4'}
h2 = {'key1'=>'val1', 'KEY_TWO'=>'val2', 'key3'=>'VALUE_3', 'key4'=>'val4'}

puts( "Keys...")
print( "h1.keys= " );	p (h1.keys )
print( "h2.keys= " );	p( h2.keys )
puts( "Values...")
print( "h1.values= " ); p( h1.values )
print( "h2.values= " ); p( h2.values )
puts
p( h1.keys & h2.keys ) 
p( h1.values & h2.values )
p( h1.keys+h2.keys )
p( h1.values-h2.values )
p( h2.values-h1.values )
p( (h1.keys << h2.keys)  )
p( (h1.keys << h2.keys).flatten.reverse  )
