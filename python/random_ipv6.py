#!/usr/bin/python
# need netaddr
# sudo  pip install netaddr
import random
from netaddr.ip import IPNetwork, IPAddress

random.seed()
ip_a = IPAddress('2001::cafe:0') + random.getrandbits(16)
ip_n = IPNetwork(ip_a)
ip_n.prefixlen = 64

print ip_a
print ip_n
