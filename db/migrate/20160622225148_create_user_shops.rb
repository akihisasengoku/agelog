class CreateUserShops < ActiveRecord::Migration
  def change
    create_table :user_shops do |t|
      t.references :user, index: true
      t.references :shop, index: true

      t.timestamps null: false
      t.index [:user_id, :shop_id], unique: true
    end
  end
end
