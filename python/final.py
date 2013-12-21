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
for line in (f):
    words = line.split()
    #print '{0}, {1}'.format(i, len(words))
    for word in words:
        print(word)
        chars = word.split()
    #print(word)
    #for char in chars:
        i += 1
        print(char)



"""
use declaration.txt as an example

>>> i = 0
>>> for word in words:
    ...   i += 1
    ...   print(i, word)
    ...
    1 one,
    2 two,
    3 three

"""


