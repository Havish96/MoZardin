class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  after_save :create_default_garden

  private

  def create_default_garden
    garden = Garden.new(name: "Default Garden")
    garden.user = self
    garden.save
  end
end
