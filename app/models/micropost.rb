class Micropost < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  # validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 420 }
  
  belongs_to :shop, class_name: 'Form::Shop', dependent: :destroy
  mount_uploader :image, MicroUploader
  # validates :shop_id, presence: true
end
