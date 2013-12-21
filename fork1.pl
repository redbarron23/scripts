#!/usr/bin/perl -w

my @cmds = ('/bin/date', '/usr/bin/time');
#@cmds = join(' ', @cmds );


sub my_system {
    $cmd = @_;
    #$cmd = shift;
    die "could not fork\n" unless defined(my $pid = fork);
    return waitpid $pid, 0 if $pid; #parent waits for child
    exec @_; #replace child with new process
}

for my $cmd (@cmds) {
   my_system($cmd);
   #my $response = getstore($url, "$1.txt");
}

#exec("/bin/date");


#__END__
#for my $cmd (@cmds) {
#   unless ($pid = fork) {
#       unless (fork) {
#           exec "$cmd";
#           die "exec failed!";
#       }
#    exit 0;
#    waitpid($pid, 0);
#   }
#}
