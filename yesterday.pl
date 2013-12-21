#!/usr/bin/perl -w
use strict;
use Date::Parse;

my $today = localtime();
my $yesterday = localtime(time-(60*60*24));
#print("Today is:$today\n");
#print("Yesterday is:$yesterday\n");

my @args = qw(/opt/local/bin/mongodump -h 127.0.0.1 --port 27017 -db badgeville_production -c);
my $collection = 'players';
my $dest = '/nfs';



my $epoch_today = str2time($today);
#print ("My Epoch Today:$epoch_today\n");

my $epoch_yesterday = str2time($yesterday);
#print ("My Epoch Yesterday:$epoch_yesterday\n");

# mongoexport -d test -c foodle -q '{ ts:{$gte:new Date(1365984000000), $lt:new Date(1366070400000)}}'
my $query = "'{ \"created_at\" : { \$gte : new Date($epoch_yesterday), \$lte : new Date($epoch_today) } }'";
print "$query\n";



push (@args, $collection, '-o', $dest, '--query', $query);
#push (@args, '--query');
#push (@args, $query);
@args = join(' ', @args );
print("@args\n");
