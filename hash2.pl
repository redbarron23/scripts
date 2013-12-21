#!/usr/bin/perl -w

 # Either build your data as a hashref
my $hashref = {
  username => someusername,
  etc => ...,
};

# or assign a reference to a hash
my %data = (username => someusername, etc => ...);
my $hashref = \%data;

# Then pass it off
my $valid = verify($hashref);
# You can also pass like so
my $valid = verify(\%data);

# Then, in your verify sub:

sub verify {
  my $ref = shift;
  
  # do something with your data
  $ref->{'username'} =~ /yourregex/;

  return $something;
}
