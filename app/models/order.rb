class Order < ActiveRecord::Base
  belongs_to :user

  validates :content, :presence => true, :length => { :in => 10..5000 }

  validates :user_id, :presence => true
end
