class Want < ActiveRecord::Base
    belongs_to :user, class_name: "User"
    belongs_to :shop, class_name: "Shop"
    validates :user_id, presence: true
    validates :shop_id, presence: true
end
