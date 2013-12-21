#!/usr/bin/perl -w

my %h = ( foo => 'bar', foo2 => 'bar2' );

myfunc(\%h);

sub myfunc {
    my $href = shift; 
    # print Hash Reference value only
    print $href->{foo}, "\n";
    print $href->{foo2}, "\n";
    # print key and value
    while( my ($k, $v) = each %$href ) {
        print "key: $k, value: $v.\n";
    }
    # print just key
    foreach my $k (keys(%$href)) {
      print "$k\n"; 
    }
}



