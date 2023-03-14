class Task < ApplicationRecord
  belongs_to :plant
  belongs_to :list

  def weather_today
    url = "http://api.weatherapi.com/v1/current.json?key=bb8ae13d2adc43af89651804231303&q=#{current_user.city},Mauritius"
    user_serialized = URI.open(url).read
    JSON.parse(user_serialized)
  end
end
