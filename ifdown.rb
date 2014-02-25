#!/usr/bin/env ruby
puts "Shutting down VirtualBox interfaces...."#

#range = (1..9).to_a
system('/sbin/ifconfig', 'vboxnet0', 'down')
system('/sbin/ifconfig', 'vboxnet1', 'down')
system('/sbin/ifconfig', 'vboxnet2', 'down')
system('/sbin/ifconfig', 'vboxnet3', 'down')
system('/sbin/ifconfig', 'vboxnet4', 'down')
system('/sbin/ifconfig', 'vboxnet5', 'down')
system('/sbin/ifconfig', 'vboxnet6', 'down')
system('/sbin/ifconfig', 'vboxnet7', 'down')
system('/sbin/ifconfig', 'vboxnet8', 'down')
