#!/usr/bin/perl -w

%hash = ('name' => 'Tom', 'age' => 19);
#print %hash;

display_hash(%hash);

sub display_hash
{
   my (%hash) = @_;
   foreach (%hash)
   {
      print "$_ => $hash{$_}\n";
   }
}
