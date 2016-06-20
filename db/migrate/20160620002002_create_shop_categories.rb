class CreateShopCategories < ActiveRecord::Migration
  def change
    create_table :shop_categories do |t|
      t.integer :shop_id
      t.integer :category_id
      
      t.timestamps null: false
      t.index [:shop_id, :category_id, :created_at], :unique => true
    end
  end
end
