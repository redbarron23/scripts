#!/usr/bin/python
import sys, string, re
string.punctuation


def splitParagraphIntoSentences(paragraph):
  '' break a paragraph into sentences
   and return a list '''
# to split by multiple characters

# regular expressions are easiest (and fastest)
  sentenceEnders = re.compile('[.!?]')
  sentenceList = sentenceEnders.split(paragraph)
  return sentenceList

if len(sys.argv) != 2:
  sys.exit("Usage: final.py filename")

  f = open(sys.argv[1])
  f.read()
  splitParagraphIntoSentences()

  #print("Length Count")
  #for line in (f):
  #words = line.split()
  #print(words)
