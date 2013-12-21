#!/usr/bin/perl -w
use strict;


sub HowdyEveryone { 
    my($name1, $name2) = @_; 
    return "Hello $name1 and $name2.\n" . "Where do you want to go with Perl today?\n"; 
}              


print &HowdyEveryone("bart", "lisa");


