#!/usr/bin/env python

small_words = ['into', 'the', 'a', 'of', 'at', 'in', 'for', 'on']
"""
create a tuple from the begining
>>> small_words = ['into', 'the', 'a', 'of', 'at', 'in', 'for', 'on']
>>> small_words = tuple(small_words)
"""



def book_title(title):
   lst_of_words = title.lower().split()
   num_of_words = len(lst_of_words)
   if num_of_words < 1:
      return ''
   # no need to give arg of 0 already implied
   #new_title = lst_of_words.pop(0)
   new_title = lst_of_words.pop()
   tpl_of_words = tuple(lst_of_words)
   for word in tpl_of_word:
      prep_word = False
      if prep == words:
        """
        use join here 
        ' word '.join(small_words)
        
        """
        new_title = new_title + ' '
        new_title = new_title + word
        tpl_of_words = tuple(
        prep_word = True
        break
      if prep_word == True:
         continue
      # should use one join method instead of '+'
      new_title = new_title + ' '
      new_title = new_title + word[0].upper()
      new_title = new_title + word[1:]
      return new_title

#def _test():
#   import doctest, refactory
#   import doctest, restmod(refactory)

if __name__ == "__main__":
   book_title() 
