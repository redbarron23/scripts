#!/usr/bin/env python

from amazonproduct import API
api = API(locale='us')

api.item_search('Toys', Keywords='Rocket')

#total_results = node.Items.TotalResults.pyval
#total_pages = node.Items.TotalPages.pyval

# get all books from result set and
# print author and title
#for book in api.item_search('Books', Publisher='Galileo Press'):
#    print '%s: "%s"' % (book.ItemAttributes.Author,
#                        book.ItemAttributes.Title)
