require "rubygems"
require "nokogiri"
require "open-uri"

url ='http://annuaire-des-mairies.com/95/vaureal.html'
def get_the_email_of_a_townhall_from_webpage(url)
	page = Nokogiri::HTML(open(url))
	mail = page.css("p.Style22").each do |contact|
		puts contact.text if contact.text.include?("@")# si le resultat contient  un @ on l'affiche.
	end
end

#puts get_the_email_of_a_townhall_from_webpage(url)

url2 = "http://annuaire-des-mairies.com/val-d-oise.html"
def get_all_the_urls_of_val_doise_townhalls(url)
	page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	tab_link = [] #array vide
	val_doise_url = page2.css("p a.lientxt").collect {|x| tab_link <<"http://annuaire-des-mairies.com"+x['href'].slice(1..-1)}
	tab_link.each do |y|
	get_the_email_of_a_townhall_from_webpage(y) end # on slice pour enlever le '.'

end
get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")
	

