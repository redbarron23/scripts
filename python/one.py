#!/usr/bin/env python
import urllib as u
import string
symbols = 'amd ibm gm kft'.split()

def get_data():
    data = []
    url = 'http://finance.yahoo.com/d/quotes.csv?s='
    for s in symbols:
        url += s+"+"
    url = url[0:-1]
    url += "&f=sb3b2l1l"
    f = u.urlopen(url,proxies = {})
    rows = f.readlines()
    for r in rows:
        values = [x for x in r.split(',')]
        symbol = values[0][1:-1]
        bid = string.atof(values[1])
        ask = string.atof(values[2])
        last = string.atof(values[3])
        data.append([symbol,bid,ask,last,values[4]])
    return data
