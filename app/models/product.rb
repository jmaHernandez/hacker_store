class Product < ActiveRecord::Base
	has_many :line_items

	validates :name, :presence => true, :uniqueness => true
	validates :price, :presence => true, :numericality => { :greater_than => 0 }
end
