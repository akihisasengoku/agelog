class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.text :image
      t.integer :microstars_count, :default => 0

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
