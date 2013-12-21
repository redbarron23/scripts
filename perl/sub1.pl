#!/usr/bin/perl -w
use strict;

my $cmd = "/bin/date";

forkme($cmd);

sub forkme {
  my $cmd = shift;
  unless (my $pid = fork) {
     die "Couldn't fork on $cmd\n";
     exec($cmd);

  }

}
