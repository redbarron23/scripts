#!/usr/bin/perl
#use strict;
use Date::Parse;
my $Today = localtime();
my $Yesterday = localtime(time-(60*60*24));
my $EpochToday = str2time($Today);
my $EpochYesterday = str2time($Yesterday);
my $Dest = '/nfs';
my $QueryCreated = "'{ \"created_at\" : { \$gte : new Date($EpochYesterday), \$lte : new Date($EpochToday) } }'";
my $QueryUpdated = "'{ \"updated_at\" : { \$gte : new Date($EpochYesterday), \$lte : new Date($EpochToday) } }'";
my $collection;
my $query;


my %Collections = (
                              'activity_definitions' => $QueryCreated,
                              'api_keys' => $QueryCreated,
                              'components' => $QueryCreated,
                              'contents' => $QueryCreated,
                              'contextual_streams' => $QueryCreated,
                              'groups' => $QueryCreated,
                              'leaderboards' => $QueryCreated,
                              'networks' => $QueryCreated,
                              'reward_definitions' => $QueryCreated,
                              'site_contents' => $QueryCreated,
                              'sites' => $QueryCreated,
                              'social_networks' => $QueryCreated,
                              'style_sets' => $QueryCreated,
                              'tracks' => $QueryCreated,
                              'units' => $QueryCreated,
                              'users' => $QueryCreated,
                              'activities' => $QueryUpdated,
                              'rewards' => $QueryUpdated,
                              'players' => $QueryCreated
                           );



my $myHashref=\%Collections;

mysubrtn($myHashref);

sub mysubrtn() {
  my $myref = shift ;
  foreach my $key (sort keys %$myref )  {

     unless (my $pid = fork) {
        die "Couldn't fork on $key" unless defined $pid;
        $SIG{CHLD} = 'IGNORE';

        my cmd = '/usr/bin/mongodump -h 127.0.0.1 --port 27017 -db badgeville_production -c $key, '-o', $Dest, '--query', myref->{$key}';
        print("$cmd\n");
        #exec(@args);
        #die "cmd failed:$!"
    }

  }
}

__END__
