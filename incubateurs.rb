require "rubygems"
require "nokogiri"
require "open-uri"

url ="http://mon-incubateur.com/site_incubateur/incubateurs"
def recuperer_incubateurs_name(url)
	page = Nokogiri::HTML(open(url))
	incubateur_name = page.css("td p span a")
	puts incubateur_name
## fonctionne
end
def recuperer_incubateurs_cp(url)
	page = Nokogiri::HTML(open(url))
	incubateur_cp = page.css("td p a")
	puts incubateur_cp.text
end
recuperer_incubateurs_cp(url)
## ne fonctionne pas


#recuperer_incubateurs_name(url)
#div#incubators_list tr:nth-child(1) > td:nth-child(2) > p > a
###div#incubators_list tr:nth-child(4) > td:nth-child(2) > p > a