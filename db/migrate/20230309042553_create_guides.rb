class CreateGuides < ActiveRecord::Migration[7.0]
  def change
    create_table :guides do |t|
      t.string :title
      t.text :description
      t.string :date
      t.string :author

      t.timestamps
    end
  end
end
