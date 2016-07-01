class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|
      t.integer :shop_id
      t.integer :user_id

      t.timestamps null: false
      
      t.index [:shop_id, :user_id], :unique => true
    end
  end
end
