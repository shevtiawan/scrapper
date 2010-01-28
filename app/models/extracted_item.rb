class ExtractedItem
	attr_accessor :product_name, :product_price
	
	def initialize(name,price)
		@product_name = name
		@product_price = price
	end
end
