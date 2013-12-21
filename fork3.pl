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
my $Host = '127.0.0.1'; 
my $Port = '27017';
my $DataBase = 'badgeville_production';


###########################
# Collections dump 
# by query \"updated_at\"
###########################
my @CollectionsUpdated = qw(
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
                           );

###########################
# Collections dump 
# by query \"created_at\"
###########################
my @CollectionsCreated = qw(
                              activities
                              rewards
                            );
###########################
#  Export players
###########################

###########################
#  loop for Update 
###########################
for my $CollectionUpdate (@CollectionsUpdated) {
    print("Exporting $CollectionUpdate\n");
    Dump_Update($CollectionUpdate);
}

###########################
# loop for Created
###########################
for my $CollectionCreated (@CollectionsCreated) {
    print("Exporting $CollectionCreated\n");
    Dump_Update($CollectionCreated);
}

###########################
# Players export
###########################

sub Dump_Update { 
    #my @collections_updated = qw(players users);
    my $CollectionUpdated = shift;

    unless (my $pid = fork) {
        die "Couldn't fork on $CollectionUpdated" unless defined $pid;
        $SIG{CHLD} = 'IGNORE';
              
        my @args = qw(/opt/local/bin/mongodump -h $Host --port $Port -db $DataBase -c);
        push (@args, $CollectionUpdated, '-o', $Dest, '--query', $QueryUpdated);
        @args = join(' ', @args );
        print(@args);
        exec(@args);
        die "cmd failed:$!"
    }
}


sub Dump_Create { 
    #my @collections_created = qw(players users);
    my $CollectionCreated = shift;

    unless (my $pid = fork) {
        die "Couldn't fork on $CollectionCreated" unless defined $pid;
        $SIG{CHLD} = 'IGNORE';

        my @args = qw(/opt/local/bin/mongodump -h $Host --port $Port -db $DataBase -c);
        push (@args, $CollectionCreated, '-o', $Dest, '--query', $QueryCreated);        
        @args = join(' ', @args );
        print(@args);
        exec(@args);
        die "cmd failed:$!"
    }
}


# fork off players here this will be mongoexport as opposed to mongodump
# export players
## cmd2 = "#{mexport} --host #{host} --port #{port} -d #{db_name} -o #{tmp_dir}/#{db_name}/players.json -c players --query '{ \"updated_at\" : { $gte : new Date(#{dateint}000), $lte : new Date(#{date_end}000) } }'"

sub Export_Players { 
    unless (my $pid = fork) {
        die "Couldn't fork on Players" unless defined $pid;
        $SIG{CHLD} = 'IGNORE';

        my @args = qw(/opt/local/bin/mongoexport -h $Host --port $Port -db $DataBase -c);
        push (@args, 'Players', '-o', $Dest, '--query', $QueryUpdated);        
        @args = join(' ', @args );
        print(@args);
        exec(@args);
        die "cmd failed:$!"
    }
}
