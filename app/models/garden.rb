class Garden < ApplicationRecord
  belongs_to :plant
  belongs_to :user
  has_many :tags
  has_many :plants, through: :tags
end
