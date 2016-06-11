class User < ActiveRecord::Base
    before_save { self.email = self.email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :title, presence: false, length: { maximum: 14 }
    validates :description, presence: false, length: { maximum: 140 }
    has_secure_password
    mount_uploader :coverimage, ImageUploader
    validates :coverimage, presence: false
end
