#!/usr/bin/env python
import sys
users = []
f = open('/etc/passwd','r')
for line in f.read().split('\n'):
  #print line
  if "/home" in line:
    user = line.split(":")[0]
    #print(user)
    users.append(user)
print(users)
f.close()
