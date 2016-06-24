class CreateMypages < ActiveRecord::Migration
  def change
    create_table :mypages do |t|
      t.string :name
      t.string :title
      t.string :sex
      t.text :description
      t.text :coverimage
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
