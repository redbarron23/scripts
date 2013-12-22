#!/usr/bin/perl -w

my $FreeMemToTotalMemRatio = 0.01;
my $TotalMem=8192;
#my $FreeMem=100;
#my $FreeMem=10;
my $FreeMem=1;

if ( $FreeMem/$TotalMem <= $FreeMemToTotalMemRatio ) {
   print "running out of memory. FreeMem = $FreeMem";
}
#exit($exitval);
