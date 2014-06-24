#!/usr/bin/env python
import urllib2
req = urllib2.Request('http://www.python.org/fish.html')
try:
    urllib2.urlopen(req)
except urllib2.HTTPError as e:
    print e.code
    print e.read()
