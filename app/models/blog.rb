class Blog < ActiveRecord::Base
	has_many :messages, :dependent => :destroy
	has_attached_file :image 
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :title, :presence => true
	validates :content, :presence => true
end
