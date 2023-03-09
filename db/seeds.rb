require "open-uri"

puts 'Destroying all Categories'
Category.destroy_all
puts 'Destroying all Gardens'
Garden.destroy_all
puts "Destroying all Plants"
Plant.destroy_all

puts "Creating 4 categories"
fruits = Category.create(name: "Fruits & Vegetables",
                         description: "Botanically, fruits and vegetables are classified depending on which part of
                         the plant they come from. A fruit develops from the flower of a plant, while the other parts
                         of the plant are categorized as vegetables. Fruits contain seeds, while vegetables can
                         consist of roots, stems and leaves.")

herbs = Category.create(name: 'Herbs',
                        description: 'In general use, herbs are a widely distributed and widespread group of plants,
                        excluding vegetables and other plants consumed for macronutrients, with savory or aromatic
                        properties that are used for flavoring and garnishing food, for medicinal purposes, or for
                        fragrances.')

trees = Category.create(name: 'Trees',
                        description: 'A tree is a tall plant that can live for a very long time. It has a single stem
                        or trunk and branches that support leaves. Beneath the ground, a tree has a root system that
                        acts as an anchor and stores the water and nutrients the plant needs to grow.')

shrubs = Category.create(name: 'Shrubs & Perennials',
                         description: 'A shrub (often also called a bush) is a small-to-medium-sized perennial woody
                         plant. Unlike herbaceous plants, shrubs have persistent woody stems above the ground. Shrubs
                         can be either deciduous or evergreen. They are distinguished from trees by their multiple stems
                         and shorter height, less than 6–10 m (20–33 ft) tall.')

aquatic = Category.create(name: 'Water & Aquatic',
                          description: 'Aquatic plants are plants that have adapted to living in aquatic environments
                          (saltwater or freshwater). They are also referred to as hydrophytes or macrophytes to
                          distinguish them from algae and other microphytes. A macrophyte is a plant that grows in or
                          near water and is either emergent, submergent, or floating.')

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
