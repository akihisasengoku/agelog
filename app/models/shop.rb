class Shop < ActiveRecord::Base
    validates :name, presence: true
    validates :address, presence: true
end
