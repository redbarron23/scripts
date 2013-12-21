#!/usr/bin/env python
import sys
import re

# test argument
if len(sys.argv) != 2:
        sys.exit("Usage: file.py filename")


# function to split paragraph and count length of word
def splitParagraphIntoSentences(paragraph):
  d = {}
  sentences = [s.strip() for s in re.split('[\.\?!]' , paragraph) if s]
  for sentence in sentences:
    words = sentence.split()
    for word in words:
      key = len(word)
      if key in d:
        d[key] += 1
      else:
        d[key] = 1
      print(key, d[key])

# open file  and split into lines
f = open(str(sys.argv[1]))

print("Length  Count")
for line in f.read().split('\n'):
   print(line)
   splitParagraphIntoSentences(line)
f.close()

#splitParagraphIntoSentences("Sentence One\nSetence two\nsentence three\nSentence Four?")j



"""
for line in f.readlines():
        print line
        f.close()

# ...and...

f = open('somefile.txt','r')
for line in f.read().split('\n'):
        print line
        f.close()
"""
