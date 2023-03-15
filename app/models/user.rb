class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :messages, dependent: :destroy
  has_many :gardens, dependent: :destroy
  has_many :lists, dependent: :destroy

  after_create :create_default_garden

  private

  def create_default_garden
    garden = Garden.new(name: "Default Garden")
    garden.user = self
    garden.save
  end
end
