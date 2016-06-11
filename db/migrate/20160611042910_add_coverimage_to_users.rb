class AddCoverimageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :coverimage, :text
  end
end
