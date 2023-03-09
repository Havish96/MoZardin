require "open-uri"

puts 'Destroying all Categories'
Category.destroy_all
puts 'Destroying all Gardens'
Garden.destroy_all
puts "Destroying all Plants"
Plant.destroy_all

puts "Creating a category"
category = Category.create(name: "Fruits & Vegetables",
                           description: "Botanically, fruits and vegetables are classified depending on which part of
                           the plant they come from. A fruit develops from the flower of a plant, while the other parts
                           of the plant are categorized as vegetables. Fruits contain seeds, while vegetables can
                           consist of roots, stems and leaves.")

puts "Creating 10 Fruit & Vegetables plants ..."

10.times do
  plant = Plant.new(name: Faker::Food.fruits,
                    description: Faker::Lorem.paragraph_by_chars(number: 114, supplemental: false),
                    scientific_name: Faker::Food.fruits,
                    category_id: 2)

  file = URI.open("https://source.unsplash.com/random")

  plant.photo.attach(io: file, filename: "#{plant.name}.png", content_type: "image/png")
  plant.category = category
  plant.save
end

puts "Done!"
