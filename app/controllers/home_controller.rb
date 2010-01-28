class HomeController < ApplicationController
	require 'open-uri'
	require 'nokogiri'
	
  def index
  end

	def extract
		keywords = params[:keywords]
		shopname = params[:shop]
		
		e = Extractor.new(shopname)
		@results = e.extract_product_from_online_web(keywords)
		
		rule = Rule.find_by_name(shopname)
		
		statistic = Statistic.new
		statistic.rule_id = rule.id
		statistic.keyword = keywords
		statistic.download_time = e.download_time
		statistic.extract_time = e.extract_time
		statistic.number_of_product_extracted = e.number_of_product_extracted
		statistic.save
		
		@results.each do |item|
			p = Product.new(:name => item.product_name, :price => item.product_price)	
			p.statistic_id = statistic.id
			p.save
		end
		
	end

end
