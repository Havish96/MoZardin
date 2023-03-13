class ChangeAgeToTags < ActiveRecord::Migration[7.0]
  def change
    remove_column :tags, :age, :integer
    add_column :tags, :age, :date
  end
end
