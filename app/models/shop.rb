class Shop < ActiveRecord::Base
    validates :name, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true
    
    has_many :microposts
    has_many :users, through: :microposts
end
