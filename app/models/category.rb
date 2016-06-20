class Category < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    
    has_many :shop_categories
    has_many :shops, through: :shop_categories
end
