#!/usr/bin/perl -w
use strict;
use Date::Parse;
my $Today = localtime();
my $Yesterday = localtime(time-(60*60*24));
my $EpochToday = str2time($Today);
my $EpochYesterday = str2time($Yesterday);
my $Dest = '/nfs';
my $QueryCreated = "'{ \"created_at\" : { \$gte : new Date($EpochYesterday), \$lte : new Date($EpochToday) } }'";
my $QueryUpdated = "'{ \"updated_at\" : { \$gte : new Date($EpochYesterday), \$lte : new Date($EpochToday) } }'";

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

# Iniate Subroutine
mysub(\@Collections);

# Subroutine that does the fork()
# fork by condition
sub mysub {

  my @Collections  = @{$_[0]};
     foreach my $Collection (@Collections) {
         if ($Collection eq 'players') {
             print("Yes players will be exported\n"); 
         }
         elsif ($Collection eq 'activities') {
            print("Yes Dumping $Collection by Created_at:$QueryCreated \n");
             #Dump($Collection, $QueryCreated); 
         }
         elsif ($Collection eq 'rewards') {
            print("Yes Dumping$Collection by Created_at:$QueryCreated\n");
             #Dump($Collection, $QueryCreated); 
         }
         else {
            print("Dumping $Collection Updated_at:$QueryUpdated  \n");
             Dump($Collection, $QueryUpdated); 
         }
      }
}




###########################

sub Dump { 
    my($Collection, $Query) = @_;

    unless (my $pid = fork) {
        die "Couldn't fork on $Collection" unless defined $pid;
        $SIG{CHLD} = 'IGNORE';
              
        my @args = qw(/usr/bin/mongodump -h 127.0.0.1 --port 27017 -db badgeville_production -c);
        push (@args, $Collection, '-o', $Dest, '--query', $Query);
        @args = join(' ', @args );
        print("@args\n");
        #exec(@args);
        #die "cmd failed:$!"
    }
}
