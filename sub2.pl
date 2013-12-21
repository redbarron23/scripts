#!/usr/bin/perl -w
use strict;
my @array = qw(a b c);
mysub(\@array);

sub mysub {

  my @array = @{$_[0]};
  foreach my $var (@array) {
    print("$var\n");
  }

}
