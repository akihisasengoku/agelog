class CreateMypages < ActiveRecord::Migration
  def change
    create_table :mypages do |t|
      t.string :name
      t.string :title, :default => "マイページタイトル"
      t.string :sex
      t.text :description, :default => "マイページ説明文"
      t.text :coverimage
      t.text :icon
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
