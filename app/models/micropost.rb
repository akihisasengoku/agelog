class Micropost < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  validates :content, presence: true, length: { maximum: 420 }
  
  belongs_to :shop, class_name: 'Form::Shop', dependent: :destroy
  mount_uploader :image, MicroUploader
  
  has_many :microstars, class_name: "Microstar", foreign_key: "micropost_id", dependent: :destroy
  has_many :star_users, through: :microstars, source: :user
end
