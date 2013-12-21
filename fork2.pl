#!/usr/bin/perl -w

use LWP::Simple;
use strict;
my @urls = qw!http://www.cnn.com/
http://www.bbc.com/
http://www.news.com/!;


for my $url (@urls) {
    get_em($url);
}

sub get_em { 
    my $url = shift;
    unless (my $pid = fork) {
        die "Couldn't fork on $url" unless defined $pid;
        die "Malformed url $url" unless $url =~ m!http://www.(.*?)/!;
              
        my $response = getstore($url, "$1.txt");
        die "$url get failed" if is_error($response);
        exit;
    }
}
