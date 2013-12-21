#!/usr/bin/perl -w
use strict;
use Date::Parse;
my $Today = localtime();
my $Yesterday = localtime(time-(60*60*24));
my $EpochToday = str2time($Today);
my $EpochYesterday = str2time($Yesterday);
my $DataBase = 'badgeville_production';
my $Dest = '/nfs';
my $QueryCreated = "'{ \"created_at\" : { \$gte : new Date($EpochYesterday), \$lte : new Date($EpochToday) } }'";
my $QueryUpdated = "'{ \"updated_at\" : { \$gte : new Date($EpochYesterday), \$lte : new Date($EpochToday) } }'";


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

myfunc(\%Collections);

sub myfunc {
    #my $href = shift; 
    my ($href) = @_;
    # print Hash Reference value only
    #print $href->{foo}, "\n";
    #print $href->{foo2}, "\n";
    # print key and value
    # print just key

    foreach my $k (keys(%{$href})) {
      #print "$href->{$k}\n"; 
    
     
      unless (my $pid = fork) {
           #die "Couldn't fork on $Collections" unless defined $pid;
           $SIG{CHLD} = 'IGNORE';

           my $cmd = "/opt/local/bin/mongodump -h 127.0.0.1 --port 27017 -d badgeville_production -c $k -o $Dest --query $href->{$k}";
           #@args = join(' ', @args );
           print("$cmd\n");
           print DUMPER(\%href);

       }
   }
}
