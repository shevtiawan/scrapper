class Extractor
	require 'open-uri'
	require 'nokogiri'

	attr_accessor :rule_name
	attr_reader :download_time, :extract_time, :number_of_product_extracted

	def initialize(shop_name)
		@rule_name = shop_name
		@download_time = 0
		@extract_time = 0
		@number_of_product_extracted = 0
	end

	def extract_product_from_online_web(keyword)
		rule = Rule.find_by_name(@rule_name)
		
		@search_term = CGI.escape(keyword)
		url_lama = rule.url
		new_url = url_lama.sub(/ini_kata_yang_diganti/, @search_term)

		time_request_to_server = Time.now
		isi = open(new_url)
		time_response_from_server = Time.now

		time_start_processing = Time.now
		doc = Nokogiri::HTML(isi)
		@items = doc.css(rule.item_rule)
		
		@hasilproduk = []
		@items.each do |item|
			item_name = item.at_css(rule.product_name_rule).text unless item.at_css(rule.product_name_rule).nil?
			item_price = item.at_css(rule.price_rule).text unless item.at_css(rule.price_rule).nil?
			extracted_item = ExtractedItem.new(item_name, item_price)
			@hasilproduk << extracted_item
			@number_of_product_extracted = @number_of_product_extracted + 1
		end
		
		time_end_processing = Time.now		
		calculate_processing_time(time_request_to_server, time_response_from_server, time_start_processing, time_end_processing)

		return @hasilproduk
	end

	def extract_product_from_offline_doc(filepath)
		rule = Rule.find_by_name(@rule_name)
		
		#@search_term = CGI.escape(keyword)
		#url_lama = rule.url
		#new_url = url_lama.sub(/ini_kata_yang_diganti/, @search_term)

		time_request_to_server = Time.now
		isi = open(filepath)
		time_response_from_server = Time.now

		time_start_processing = Time.now
		doc = Nokogiri::HTML(isi)
		@items = doc.css(rule.item_rule)
		
		@hasilproduk = []
		@items.each do |item|
			item_name = item.at_css(rule.product_name_rule).text unless item.at_css(rule.product_name_rule).nil?
			item_price = item.at_css(rule.price_rule).text unless item.at_css(rule.price_rule).nil?
			extracted_item = ExtractedItem.new(item_name, item_price)
			@hasilproduk << extracted_item
			@number_of_product_extracted = @number_of_product_extracted + 1
		end
		
		time_end_processing = Time.now		
		calculate_processing_time(time_request_to_server, time_response_from_server, time_start_processing, time_end_processing)

		return @hasilproduk
	end

	private

	def calculate_processing_time(time_request_to_server, time_response_from_server, time_start_processing, time_end_processing)
		@download_time = time_response_from_server - time_request_to_server
		@extract_time = time_end_processing - time_start_processing
	end

end

