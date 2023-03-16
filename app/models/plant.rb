class Plant < ApplicationRecord
  belongs_to :category
  has_many :tags
  has_many :gardens, through: :tags
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name,
                  against: %i[name scientific_name],
                  associated_against: { category: :id },
                  using: { tsearch: { prefix: true } }
end
