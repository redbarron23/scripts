#!/usr/bin/perl -w
use strict;
my %new_stuff = ( "RATING" => 4.99 );
db_modify_account( "jdonald", \%new_stuff );

sub db_modify_account {
    my( $uid, $ref_new_data ) = @_;
    while ( ( my $key, my $value ) = each %{ $ref_new_data } ) {
        print "The $key is: $value.<br />";
    }
    print "Oh, and the user is $uid.<br />";
}
