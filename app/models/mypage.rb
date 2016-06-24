class Mypage < ActiveRecord::Base
    validates :title, length: { maximum: 14 }
    validates :description, length: { maximum: 140 }
    mount_uploader :coverimage, ImageUploader
    belongs_to :user
end
