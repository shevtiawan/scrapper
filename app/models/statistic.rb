class Statistic < ActiveRecord::Base
	belongs_to :rule
	has_many :products
end
