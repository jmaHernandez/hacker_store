class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product

	validates :product_id, :presence => true, :numericality => { only_integer: true }
	validates :quantity, :presence => true, :numericality => { only_integer: true, greater_than: 0 }
end
