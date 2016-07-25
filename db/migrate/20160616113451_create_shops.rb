class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :mainimage

      t.timestamps null: false
    end
  end
end
