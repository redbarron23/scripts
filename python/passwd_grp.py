#!/usr/bin/env python
import pwd, grp

for p in pwd.getpwall():
    if p[0] == grp.getgrgid(p[3])[0]:
       pass
    else:
        print p[0], grp.getgrgid(p[3])[0]
