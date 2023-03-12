class Garden < ApplicationRecord
  belongs_to :user
  has_many :tags
  has_many :plants, through: :tags

  validates :name, presence: true
end
