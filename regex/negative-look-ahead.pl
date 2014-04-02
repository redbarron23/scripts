#!/usr/bin/perl -w
my $string = "Monday Tuesday Wednesday Thursday";
#print "$string\n";

#  Will not print because Monday is followed by Tues
if ($string =~ m/Monday\s(?!Tuesday)/) {
    print "Negative lookahead\n";
}

# Will print since Thurs is not followed by Monday 
if ($string =~ m/Monday\s(?!Thursday)/) {
    print "Negative lookahead\n";
}
