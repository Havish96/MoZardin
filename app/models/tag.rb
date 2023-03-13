class Tag < ApplicationRecord
  belongs_to :garden
  belongs_to :plant

  validates :age, :garden, :location, presence: true
end
