class CreateConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :conditions do |t|
      t.string :sun
      t.string :water
      t.string :climate
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
