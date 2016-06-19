class AddShopIdToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :shop_id, :integer
    add_index :microposts, :shop_id
  end
end
