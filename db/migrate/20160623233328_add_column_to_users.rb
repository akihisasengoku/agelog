class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string, unique: true
    add_column :users, :uid, :string, unique: true
    add_column :users, :token, :string, unique: true
  end
end
