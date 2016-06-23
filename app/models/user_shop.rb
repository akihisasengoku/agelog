class UserShop < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :shop, class_name: "Shop"
end
