class CreateAges < ActiveRecord::Migration
  def change
    create_table :ages do |t|
      t.integer :shop_id
      t.integer :user_id

      t.timestamps null: false
      
      t.index [:shop_id, :user_id], :unique => true
    end
  end
end
