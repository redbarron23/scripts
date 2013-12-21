#!/usr/bin/perl -w

my @Collections = qw(
                              activity_definitions 
                              api_keys 
                              components 
                              contents 
                              contextual_streams 
                              groups 
                              leaderboards 
                              networks 
                              reward_definitions 
                              site_contents 
                              sites 
                              social_networks
                              style_sets
                              tracks 
                              units 
                              users
                              activities
                              rewards
                              players
                           );



foreach my $Collection (@Collections) {
   print("$Collection\n");
}
