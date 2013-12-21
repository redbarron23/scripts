#!/usr/bin/perl
# 
# # use module
use Crypt::RandPasswd;
#  
# generate password
$word = Crypt::RandPasswd->word(5, 10);
print "$word\n";
