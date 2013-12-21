#!/usr/bin/env python
import sys
if len(sys.argv) != 2:
    sys.exit("Usage: file.py filename")

#print ("Script name: %s" % str(sys.argv[0]))
#print ("First argument: %s" % str(sys.argv[1]))

f = open(str(sys.argv[1]))
# prints the whole file
#print(f.read())

# print one line
#print(f.readline())

i = 0
print("Length  Count")
for i, line in enumerate(f):
    i = i + 1
    words = line.split()
    #print(i, line)
    #print(i, len(words))
    print '{0}, {1}'.format(i, len(words))
