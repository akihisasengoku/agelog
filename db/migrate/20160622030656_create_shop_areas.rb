class CreateShopAreas < ActiveRecord::Migration
  def change
    create_table :shop_areas do |t|
      t.integer :shop_id
      t.integer :area_id

      t.timestamps null: false
      t.index [:shop_id, :area_id, :created_at], :unique => true
    end
  end
end
