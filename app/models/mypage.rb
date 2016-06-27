class Mypage < ActiveRecord::Base
    validates :name, length: { maximum: 14 }
    validates :title, length: { maximum: 20 }
    validates :description, length: { maximum: 166 }
    mount_uploader :coverimage, ImageUploader
    mount_uploader :icon, ImageUploader
    belongs_to :user
end
