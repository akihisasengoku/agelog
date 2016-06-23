class AddColumnTypeToUserShop < ActiveRecord::Migration
  def change
    add_column :user_shops, :type, :string
  end
end
