#!/usr/bin/perl

$fruit{'Apple'} = "Red";
$fruit{'Orange'} = "Orange";
$fruit{'Grape'} = "Purple";
$fruit{'Lemon'} = "Yellow";
$fruit{'Lime'} = "Green";

$myHashref=\%fruit;

&mysubrtn($myHashref);



sub mysubrtn() {
  $myref = shift ;
  print "In my Subrtn\n";
  print "Print hash via reference\n\n";
  foreach $key (sort keys %$myref )  {
     #print $key, '=', ${ $myref }{$key}, "\n";
     print $key, '=', $myref->{$key}, "\n";
  }
}

__END__
#print "Hash reference to send = $myHashref\n";
#print "Print local hash\n\n";
#foreach $key (sort keys %fruit) {
#     print $key, '=', $fruit{$key}, "\n";
#}
#print "\nLeaving Main\n\n";
