class ShopArea < ActiveRecord::Base
    belongs_to :shop
    belongs_to :area
end
