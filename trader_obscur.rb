require "rubygems"
require "nokogiri"
require "open-uri"

url = "https://coinmarketcap.com/all/views/all/"
def crypto_trading(url)
	page = Nokogiri::HTML(open(url))
	tab_name =[]
	crypto_name = page.css("a.currency-name-container").collect {|y| 
		tab_name << y.text
	} # on a store les valeurs de crypto_name dans un array
	tab_price=[]
	crypto_price = page.css("a.price").each {|x| 
		tab_price << x.text
	} # on a store les valeurs de crypto_price dans un autre array
	res =tab_name.zip tab_price # ==> nous donne un hash (name =key, price = value)
	res.each {|key, value| puts "#{key} is currently #{value}"}
end
print crypto_trading(url)