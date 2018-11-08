class SayHello

require 'rubygems'
require 'nokogiri'
require 'open-uri'

def scrap
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	nom_monnaies = doc.css('a.currency-name-container').map do |keys|
		keys.text
	end

	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	valeur_monnaies = doc.css('a.price').map do |keys|
		keys.text
	end

	@crypto_hash = Hash[nom_monnaies.zip(valeur_monnaies)]

	return @crypto_hash
end

def save
	Crypto.delete_all
	@crypto_hash.each do |k,v|
        Crypto.create!(name: k, trade: v)
	end
end

def perform
	scrap
	save
end

end
