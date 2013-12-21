#!/usr/bin/perl -w
use strict;
use DateTime qw();
my $yesterday = DateTime->now->subtract(days => 1);
rint("$yesterday\n");
