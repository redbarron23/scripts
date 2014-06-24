#!/usr/bin/perl 
my $string = "Monday Tuesday Wednesday Thursday Friday"


# This matches Thurday following a Fri
if ($string =~ m/(?<=Thursday)\sFriday/) {
  print "Positive lookbehind!\n";
}
