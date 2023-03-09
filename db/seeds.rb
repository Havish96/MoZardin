require "open-uri"

puts "Destroying all Plants"
Plant.destroy_all

puts "Creating a category"
category = Category.create(name: "Fruits & Vegetables",
                           description: "Botanically, fruits and vegetables are classified depending on which part of
                           the plant they come from. A fruit develops from the flower of a plant, while the other parts
                           of the plant are categorized as vegetables. Fruits contain seeds, while vegetables can
                           consist of roots, stems and leaves.")

puts "Creating 10 Fruit & Vegetables plants ..."

puts "creating fruits"
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
puts "created fruits"

Guide.destroy_all
puts "creating guide"
sample_document = File.read(Rails.root.join('db', 'seeds', 'How_to_plant_grass_seed.html'))
Guide.create(title: "How to plant grass seed",
             description: sample_document,
             date: "September 18, 2019",
             author: "Bertram Perry",
             image_url: "https://nualgiponds.com/wp-content/uploads/2014/04/water-garden-residential-pond-1080x745.jpg"
)

puts "Done!"
