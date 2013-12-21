#!/usr/bin/env python
import sys

if len(sys.argv) != 2:
        sys.exit("Usage: file.py filename")

f = open(sys.argv[1])

i = 0
print("Length Count")
for line in (f):
    #print(line)
    words = line.split()
    #print(words)
    for word in words:
        print(word, len(word))

"""
string.punctuation
read the file with f.read()
split into words
tally lenghts into a dict with keys = wordlength value = how many of that word lenght

ignore the word and


letter in 'a'
letter in string.punctuation
False

letter = '.'
letter in string.punctuation
True

output should look like this
1 16
2 267
3 267
4 169
.....

word = 'this'
len(word)
4

