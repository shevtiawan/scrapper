class HomeController < ApplicationController
	require 'open-uri'
	require 'nokogiri'
	
  def index
  end

	def extract
		keywords = params[:keywords]
		shopname = params[:shop]
		
	end

end
