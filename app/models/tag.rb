class Tag < ApplicationRecord
  belongs_to :garden
  belongs_to :plant

  validates :age, :garden, :location, presence: true
  validates :age, :numericality => { greater_than_or_equal_to: 0 }
end
