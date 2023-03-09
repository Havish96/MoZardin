require "open-uri"
category = Category.create(name: "fruit", description: "fruits")
puts "destroying all plants"
Plant.destroy_all
puts "destroyed all plants"

puts "Creating a category"
Category.create(name: "fruit", description: "fruits")
puts "created category"

puts "creating fruits"
1.times do
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

Guide.create(title: "HOW TO START SEEDS INDOORS",
              description: Faker::Lorem.paragraph(sentence_count: 30),
              date: "September 18, 2019",
              author: "Bertram Perry",
              image_url: "https://nualgiponds.com/wp-content/uploads/2014/04/water-garden-residential-pond-1080x745.jpg"
)
