class Shop < ActiveRecord::Base
    validates :name, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true
    
    has_many :microposts
    has_many :users, through: :microposts
    
    has_many :shop_categories
    has_many :categories, through: :shop_categories
    accepts_nested_attributes_for :shop_categories, allow_destroy: true
    
    has_many :shop_areas
    has_many :areas, through: :shop_areas
    accepts_nested_attributes_for :shop_areas, allow_destroy: true
end
