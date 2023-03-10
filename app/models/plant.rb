class Plant < ApplicationRecord
  belongs_to :category
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name,
                  against: %i[name scientific_name],
                  using: { tsearch: { prefix: true } }
end
