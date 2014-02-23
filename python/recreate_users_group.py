#!/usr/bin/python

# Grab a list of users from /etc/passwd & /etc/shadow and dump the user_add
# command to add them to a new machine
# I borrowed (author unknown)

import sys
import pwd

users = sys.argv[1:]
userdb = {}
groupdb = {}


def getGroupDB():
    if len(groupdb) == 0:
        fp = open('/etc/group', 'r')
        for line in fp:
            line=line.strip()
            (gname, j, gid, users) = line.split(':')
            ulist = users.split(',')
            groupdb[gname] = ulist
    return groupdb

def getSupGrps(u):
    # Return a list of supplemental groups for a username
    suppgrps = []
    gdb = getGroupDB()
    for (gnam, ulist) in gdb.iteritems():
        if u in ulist:
            suppgrps.append(gnam)
    return suppgrps


for u in users:
    try:
        pwent = pwd.getpwnam(u)
    except KeyError:
        print 'Username %s does not exist. Aborting.' % u
        sys.exit(1)

    uent = { 'passwd': '',
        'uid': pwent[2],
        'gid': pwent[3],
        'gecos': pwent[4],
        'home': pwent[5],
        'shell': pwent[6]
                }

    userdb[u] = uent


fpShadow = open('/etc/shadow', 'r')

for line in fpShadow:
    (u, p, j) = line.split(':', 2)
    if u in users:
        userdb[u]['passwd'] = p
fpShadow.close()

cmdtmpl = "useradd -c '%s' -d '%s' -g '%s' -m -p '%s' -s '%s' -u '%s' -G '%s' %s"

for (u, d) in userdb.iteritems():
    suppgrps = ','.join(getSupGrps(u))
    print cmdtmpl % (d['gecos'], d['home'], d['gid'], d['passwd'], d['shell'], d['uid'], suppgrps, u)
