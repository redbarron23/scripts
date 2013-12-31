#!/usr/bin/env python

from bs4 import BeautifulSoup
from urllib3 import PoolManager

# Amazon's search URL to which one may append search keywords
BASE_URL = "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=sony+alpha+lens&rh=i%3Aaps%2Ck%3A"

#def make_soup(url):
    #html = urlopen(url).read()
    #return BeautifulSoup(html, "lxml")

def make_soup(file):
	handler = open(file).read()
	return BeautifulSoup(handler, "lxml")

def get_product_links(file):
	#soup = make_soup(search_url)
	soup = make_soup(file)
	product_links=[]
    	for h3_ref in soup.findAll('h3'):
		product_links.append(h3_ref.a.get('href'))
	#print "PRODUCT LINKS",product_links
    	return product_links

def get_product_details(product):
	#soup = make_soup(product_url)
	soup = make_soup(product)
	main_image = soup.find('img', id="main-image-nonjs")
	image_url=soup('img', {'id' : 'main-image-nonjs' })[0]['src']
	asin_soup = soup.find('div', id="detail-bullets")
	#print "ASIN SOUP = ", asin_soup
	asin = soup.find('li','ASIN\:')
	#print "ASIN =", asin
	return image_url
    	#return {"category": category,
        #    "category_url": category_url,
        #    "winner": winner,
        #    "runners_up": runners_up}


# print "Get Category Links", get_category_links("http://www.chicagoreader.com/chicago/best-of-chicago-2011-food-drink/BestOf?oid=4106228")


# for cl in get_category_links("http://www.chicagoreader.com/chicago/best-of-chicago-2011-food-drink/BestOf?oid=4106228") :
	#print "Category URL", cl
	#print "Category Winner", get_category_winner(cl)
	#print "\n"


SEARCH_URL = "http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=sony+alpha+lens&rh=i%3Aaps%2Ck%3A"
search_string="sony+alpha+lens"
search_string_url = SEARCH_URL + search_string
#print "search_string_url = ", search_string_url
#print "\n"

file = "amazon1.html"
for pl in get_product_links("amazon1.html") :
	print pl
	product = "prod1.html"
	image_url = get_product_details(product)
	print image_url
