class Extractor
	require 'open-uri'
	require 'nokogiri'

	attr_accessor :rule_name

	def initialize(shop_name)
		@rule_name = shop_name
	end

	def extract_product_from_online_web(keyword)
		rule = Rule.find_by_name(@rule_name)
		
		
		
		@search_term = CGI.escape(keyword)
		url_lama = rule.url
		new_url = url_lama.sub(/ini_kata_yang_diganti/, @search_term)
		isi = open(new_url)
		doc = Nokogiri::HTML(isi)
		@items = doc.css(rule.item_rule)
		
		@hasilproduk = "kosong"
		@items.each do |item|
			@hasilproduk = item.at_css(".prodLink").text unless item.at_css(".prodLink").nil?
		end

		return @hasilproduk
	end

	def extract_product_from_offline_doc(file)

	end

end

