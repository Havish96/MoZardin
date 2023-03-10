class Plant < ApplicationRecord
  belongs_to :category
  has_many :tags
  has_many :gardens, through: :tags

  has_one_attached :photo
end
