class Photo < ApplicationRecord
  belongs_to :product
  has_attached_file :image, styles: { medium: "250x250>", thumb: "100x100>" }, default_url: "default-img.jpg"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
