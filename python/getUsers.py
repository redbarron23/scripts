#!/usr/bin/env python
import sys, subprocess

# get hostname
p = subprocess.Popen(['hostname'], stdout=subprocess.PIPE,
                                   stderr=subprocess.PIPE)
hostname, err = p.communicate()
hostname.rstrip('\n')

userList = []
f = open('/etc/passwd','r')
for line in f.read().split('\n'):
  #if "/home" in line:
  if "/bash" in line:
    user = line.split(":")[0]
    userList.append(user)
  if "/sh" in line:
    user = line.split(":")[0]
    userList.append(user)
  if "/zsh" in line:
    user = line.split(":")[0]
    userList.append(user)

print(hostname.strip(),"Users are:")
print(userList)
