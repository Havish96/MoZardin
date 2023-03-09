class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.integer :age
      t.string :location
      t.references :garden, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
