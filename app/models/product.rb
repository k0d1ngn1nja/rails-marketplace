class Product < ApplicationRecord
	has_many :photos
	validates :title, :description, :price,  presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :photo_ids, presence: true
	belongs_to :user

end
