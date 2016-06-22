class Area < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    
    has_many :shop_areas
    has_many :shops, through: :shop_areas
end
