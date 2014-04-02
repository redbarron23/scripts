#!/usr/bin/perl -w
my $string = "Monday Tuesday Wednesday Thursday";
#print "$string\n";

# will not match because Tues is after is before Wed
if ($string =~ m/Monday\s(?=Wednesday)/) {
    print "Positive lookahead\n";
}

# will match because Tues is after Monday
if ($string =~ m/Monday\s(?=Tuesday)/) {
    print "Positive lookahead\n";
}
