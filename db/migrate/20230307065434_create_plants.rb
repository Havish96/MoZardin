class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.text :description
      t.string :scientific_name
      t.string :origin
      t.text :instruction
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
