#!/usr/bin/env python
import pwd, grp

def GetHome():
  ""return usernames and homdirs"
  for p in pwd.getpwall():
      if "/Users" in p[5]:
         print p[0], p[5], p[6]

if __name__ == "__main__":
    GetHome()

