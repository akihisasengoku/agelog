class CreateMicrostars < ActiveRecord::Migration
  def change
    create_table :microstars do |t|
      t.integer :micropost_id
      t.integer :user_id

      t.timestamps null: false
      
      t.index [:micropost_id, :user_id], :unique => true
    end
  end
end
