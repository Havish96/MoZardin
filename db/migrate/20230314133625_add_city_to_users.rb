class AddCityToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :city
    add_column :users, :city, :string, null: false
  end
end
