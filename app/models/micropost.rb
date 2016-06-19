class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 420 }
  
  belongs_to :shop
  validates :shop_id, presence: true
end
