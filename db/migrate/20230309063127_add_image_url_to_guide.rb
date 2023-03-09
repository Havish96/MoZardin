class AddImageUrlToGuide < ActiveRecord::Migration[7.0]
  def change
    add_column :guides, :image_url, :string
  end
end
