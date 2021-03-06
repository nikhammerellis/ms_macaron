class Product < ActiveRecord::Base
	has_attached_file :image 
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :name, :presence => true
	validates :description, :presence => true
end
