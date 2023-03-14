class Garden < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :plants, through: :tags

  validates :name, presence: true
end
