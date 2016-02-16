class Order < ActiveRecord::Base
	belongs_to :user
	has_many :line_items, dependent: :destroy
	
	validates :name, :presence => true, :uniqueness => true
	validates :status, :presence => true
end
