class Message < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user

  validates :message,
  			:presence => true,
  			:length => { :in => 4..5000 }
  validates :blog_id, 
  			:presence => true
  validates :user_id,
  			:presence => true
end
