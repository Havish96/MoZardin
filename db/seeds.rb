require "open-uri"

Condition.destroy_all
puts "Destroying all Plants"
Plant.destroy_all
puts 'Destroying all Categories'
Category.destroy_all
puts 'Destroying all Gardens'
Garden.destroy_all

puts "Creating 4 categories"
fruits = Category.create(name: "Fruits & Vegetables",
                         description: "Botanically, fruits and vegetables are classified depending on which part of" \
                                      "the plant they come from. A fruit develops from the flower of a plant, while" \
                                      "other parts of the plant are categorized as vegetables. Fruits contain seeds," \
                                      "while vegetables can consist of roots, stems and leaves.")

herbs = Category.create(name: 'Herbs',
                        description: "In general use, herbs are a widely distributed and widespread group of plants," \
                                     "excluding vegetables and other plants consumed for macronutrients, with savory" \
                                     "or aromatic properties that are used for flavoring and garnishing food, for" \
                                     "medicinal purposes, or for fragrances.")

trees = Category.create(name: 'Trees',
                        description: "A tree is a tall plant that can live for a very long time. It has a single stem" \
                                     "or trunk and branches that support leaves. Beneath the ground, a tree has a" \
                                     "root system that acts as an anchor and stores the water and nutrients the plant" \
                                     "needs to grow.")

aquatic = Category.create(name: 'Water & Aquatic',
                          description: "Aquatic plants are plants that have adapted to living in aquatic environments" \
                                       "(saltwater or freshwater). They are also referred to as hydrophytes or" \
                                       "macrophytes to distinguish them from algae and other microphytes. A" \
                                       "macrophyte is a plant that grows in or near water and is either emergent," \
                                       "submergent, or floating.")

puts "Creating 16 plants ..."

# Category - Fruits & Vegetables
plant1 = Plant.new(name: 'Tomato',
                   description: "The tomato is the most popular and versatile vegetable grown worldwide. It is a" \
                                "warm-season crop that needs about a three-month growing season to reach" \
                                "fruit-producing stage.",
                   scientific_name: 'Lycopersicon esculentum', origin: 'South America',
                   instruction: "Plant seedlings in open beds when they are 100-120mm tall. Seedlings of tall-growing" \
                                "hybrids can be planted 500mm apart in the row.")
plant1.category = fruits
plant1_photo = URI.open('https://images.unsplash.com/photo-1592841200221-a6898f307baa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80')
plant1.photo.attach(io: plant1_photo, filename: "#{plant1.name}.png", content_type: "image/png")
plant1.save
cond1 = Condition.new(sun: '6 or more hours', water: 'Requires regular watering', climate: '10˚C to 38˚C')
cond1.plant = plant1
cond1.save

plant2 = Plant.new(name: 'Cucumber',
                   description: "When grown naturally outdoors, cucumbers are warm-season vegetables that utilize" \
                                "crosspollination to produce fruits. Fruits should be ready for picking 8-10 weeks" \
                                "after sowing. Pick regularly, before the pips start to harden. Cucumbers are used in" \
                                "salads and sandwich fillings.",
                   scientific_name: 'Cucumis sativus', origin: 'India',
                   instruction: "Cucumber can be grown up fences, over pergolas, up sunflower stalks, and love to be" \
                                "near beans, radishes and green peppers. Also, they release a root secretion" \
                                "which inhibits weeds. They are creeping vines that generally need a trellis or" \
                                "supporting frame, but can also be grown in rows or basins 300mm across and ±1m apart.")
plant2.category = fruits
plant2_photo = URI.open('https://empire-s3-production.bobvila.com/articles/wp-content/uploads/2022/05/iStock-1298556952-how-to-grow-cucumbers.jpg')
plant2.photo.attach(io: plant2_photo, filename: "#{plant2.name}.png", content_type: "image/png")
plant2.save
cond2 = Condition.new(sun: '6 or more hours', water: 'Requires regular watering', climate: '23˚C to 30˚C')
cond2.plant = plant2
cond2.save

plant3 = Plant.new(name: 'Strawberry',
                   description: "Strawberries are very adaptable and will grow everywhere, although the flavour" \
                                "is best in cooler climates. Ideal for small gardens, as they need little space and" \
                                "can be grown in containers. Always buy plants certified as virus-free.",
                   scientific_name: 'Fragaria x ananassa', origin: 'Northen Europe',
                   instruction: "Plant 250mm apart in rows, leaving 600mm between rows. Plant in autumn to ensure a" \
                   "good crop in early summer. use compost- enriched soil and mulch to preserve soil moisture. Water" \
                   "regularly and feed once a month with liquid fertilizer during the active growing season.")
plant3.category = fruits
plant3_photo = URI.open('https://images.unsplash.com/photo-1602083158217-c608d17c44e5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80')
plant3.photo.attach(io: plant3_photo, filename: "#{plant3.name}.png", content_type: "image/png")
plant3.save
cond3 = Condition.new(sun: '8 to 10 hours', water: 'Requires regular watering', climate: '12˚C to 27˚C')
cond3.plant = plant3
cond3.save

plant4 = Plant.new(name: 'Pumpkin',
                   description: "Pumpkins, squash, marrows and courgettes (baby marrows) all fall into the same" \
                                "group of easy-to grow, warm-season crops. Pumpkins are rampant growers and not ideal" \
                                "for smaller gardens as they take up too much space. The flowers are also edible and" \
                                "can be added to dishes as flavouring.",
                   scientific_name: 'Cucurbita maxima', origin: 'North and South America',
                   instruction: 'For pumpkins, plant six to eight seeds 20mm deep in soil basins 300mm in diameter' \
                   'and 2m apart; well-enriched soil with good drainage is best. Plant near mealies, beans and' \
                   'radishes. also plant garlic and chives near them, this helps with mildew.')
plant4.category = fruits
plant4_photo = URI.open('https://images.unsplash.com/photo-1515589654462-a9881e276b84?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80')
plant4.photo.attach(io: plant4_photo, filename: "#{plant4.name}.png", content_type: "image/png")
plant4.save
cond4 = Condition.new(sun: '6 to 8 hours', water: 'Requires regular watering', climate: '19˚C to 35˚C')
cond4.plant = plant4
cond4.save

# Category - Herbs
plant5 = Plant.new(name: 'Garlic',
                   description: 'A perennial plant, consisting of a clump of flat leaves, round pinkish flowerheads' \
                                'and a compound bulb divided into cloves, each covered in a white or mottled purple,' \
                                'parchment-like skin. It is a close relative of the onion. Garlic is a natural' \
                                'antibiotic, an antiseptic, a blood tonic, toner and cleanser.',
                   scientific_name: 'Allium sativum', origin: 'Eurasia, Siberia and North America.',
                   instruction: 'Press individual cloves 30mm deep into well-prepared soil and space them about 80mm' \
                                'apart. This plant relies on well-prepared soil. Seed can be sown in trays filled' \
                                'with sand in spring or autumn. Keep moist and protected until strong enough to handle')
plant5.category = herbs
plant5_photo = URI.open('https://images.squarespace-cdn.com/content/v1/5324bf63e4b05fc1fc6ea99d/1540800074825-GFN9NEXA0V899OCQK8O4/allium-sativum_bloem-garlic.jpg?format=1500w')
plant5.photo.attach(io: plant5_photo, filename: "#{plant5.name}.png", content_type: "image/png")
plant5.save
cond5 = Condition.new(sun: '8 to 10 hours', water: 'Requires regular watering', climate: '5˚C to 15˚C')
cond5.plant = plant5
cond5.save

plant6 = Plant.new(name: 'Coriander',
                   description: 'One of the top five favourite spices in the world. An annual herb with dark green,' \
                                'parsley-like leaves and small white or purplish-tinged flowers. The leaves, which' \
                                'have a distinctive taste, are known by various culinary terms, including coriander,' \
                                'dhania, cilantro and Chinese parsley. An annual herb with dark green, parsley-like' \
                                'leaves',
                   scientific_name: 'Coriandrum sativum', origin: 'Eastern Mediterranean',
                   instruction: 'Sow in a sunny spot. Seed formation in coriander is hindered by proximity to fennel,' \
                                'so don\'t grow these plants near each other. It can be placed in a large pot on a' \
                                'veranda or patio.')
plant6.category = herbs
plant6_photo = URI.open('https://images.unsplash.com/photo-1588879460618-9249e7d947d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80')
plant6.photo.attach(io: plant6_photo, filename: "#{plant6.name}.png", content_type: "image/png")
plant6.save
cond6 = Condition.new(sun: '5 to 10 hours', water: 'Requires regular watering', climate: '17˚C to 28˚C')
cond6.plant = plant6
cond6.save

plant7 = Plant.new(name: 'Peppermint',
                   description: 'A spreading perennial herb with dark green leaves and reddish stems. The leaves are' \
                                'excellent for flavouring ice-creams, chocolate desserts and cakes. Commercially' \
                                'extracted peppermint oil is used to flavour confectionery.',
                   scientific_name: 'Mentha x piperita', origin: 'Europe, Northen Africa, North America and Australia',
                   instruction: 'Peppermint is an incredibly adaptable plant, but ideally it prefers a cool, moist' \
                                'climate with well-draining, loose, organically-rich soil. Keep the area around your' \
                                'mint free of weeds.')
plant7.category = herbs
plant7_photo = URI.open('https://www.almanac.com/sites/default/files/styles/or/public/image_nodes/mint-planting-growing-harvesting.jpg?itok=zOGB9Ch_')
plant7.photo.attach(io: plant7_photo, filename: "#{plant7.name}.png", content_type: "image/png")
plant7.save
cond7 = Condition.new(sun: '2 to 5 hours', water: 'Requires regular watering', climate: '12˚C to 22˚C')
cond7.plant = plant7
cond7.save

plant8 = Plant.new(name: 'Thyme',
                   description: 'A woody, low-growing plant with stiff stems covered in strongly aromatic, small,' \
                                'oval greygreen leaves. It has small clusters of lilac flowers. A popular culinary' \
                                'herb, used in stews for its strong delicious flavour. Thymol oil, can be used to' \
                                'chase fleas, flies, mosquitoes and ants. It is also used for perfumes and medicines.',
                   scientific_name: 'Thymus vulgaris', origin: 'Mediterranean regions',
                   instruction: 'Ideal for pots in full sun. Thyme planted along pathways and around vegetable' \
                                'gardens, keeps out insects.')
plant8.category = herbs
plant8_photo = URI.open('https://images.unsplash.com/photo-1594027308808-24b68af6829b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80')
plant8.photo.attach(io: plant8_photo, filename: "#{plant8.name}.png", content_type: "image/png")
plant8.save
cond8 = Condition.new(sun: '8 to 12 hours', water: 'Requires regular watering', climate: '20˚C to 32˚C')
cond8.plant = plant8
cond8.save

# Category - Trees
plant9 = Plant.new(name: 'Baobab',
                   description: 'This extraordinary tree, from the drier northern parts of South Africa, looks as' \
                                'if it has been planted upside down. It bears waxy white flowers which are followed' \
                                'by large, egg-shaped fruits covered in fine hair. The short-lived flowers open in' \
                                'the late afternoon and decline within 24 hours. Baobabs are notable for their huge' \
                                'trunk circumference and heavily folded bark, in shades of grey and reddish brown',
                   scientific_name: 'Adansonia digitata', origin: 'Southern Africa',
                   instruction: 'These trees work well as accent plants for large gardens in warmer areas.' \
                                'Unfortunately, these trees are quite rare.')
plant9.category = trees
plant9_photo = URI.open('https://images.unsplash.com/photo-1558694440-03ade9215d7b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80')
plant9.photo.attach(io: plant9_photo, filename: "#{plant9.name}.png", content_type: "image/png")
plant9.save
cond9 = Condition.new(sun: '8 to 12 hours', water: 'Requires moderate/little watering', climate: '14˚C to 35˚C')
cond9.plant = plant9
cond9.save

plant10 = Plant.new(name: 'Flamboyant',
                    description: 'Only suitable for the warmer areas of the country and for very large gardens. A' \
                                 'magnificent, flowering shade tree with a large, flat top that is covered with' \
                                 'striking, orange-red flowers in summer.',
                    scientific_name: 'Delonix regia', origin: 'Madagascar',
                    instruction: 'Flame trees are propagated from seed. Let the dry seeds swell in lukewarm water' \
                                 'for a few days before you put them in cultivation soil. Keep them at a steady' \
                                 'temperature of 68° F / 20°C. It will take three weeks until the seeds germinate.')
plant10.category = trees
plant10_photo = URI.open('https://images.unsplash.com/photo-1654343202834-cf6d0738c4dd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2346&q=80')
plant10.photo.attach(io: plant10_photo, filename: "#{plant10.name}.png", content_type: "image/png")
plant10.save
cond10 = Condition.new(sun: '8 to 12 hours', water: 'Requires regular watering', climate: '20˚C to 30˚C')
cond10.plant = plant10
cond10.save

plant11 = Plant.new(name: 'Pod Mahogany',
                    description: 'A handsome tree with a spreading crown. Sprays of pinkish-red flowers appear in' \
                                 'early summer, followed by large, woody pods with attractive seeds. Tolerates' \
                                 'salt-laden winds.',
                    scientific_name: 'Afzelia quanzensis', origin: 'Southern Africa',
                    instruction: 'Plant mahogany in full sun with plenty of room to spread. They are highly salt' \
                                 'and drought tolerant and do well in coastal areas. Mahoganies grow to become large' \
                                 'trees with aggressive roots. Generally, plant them no closer than 20 feet from' \
                                 'permanent structures and 5 to 6 feet from sidewalks and curbs.')
plant11.category = trees
plant11_photo = URI.open('https://images.unsplash.com/photo-1502082553048-f009c37129b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80')
plant11.photo.attach(io: plant11_photo, filename: "#{plant11.name}.png", content_type: "image/png")
plant11.save
cond11 = Condition.new(sun: '8 to 12 hours', water: 'Requires moderate/little watering', climate: '20˚C to 30˚C')
cond11.plant = plant11
cond11.save

plant12 = Plant.new(name: 'Alexandra palm, king palm',
                    description: 'The King Palm has a solitary, smooth, light-grey trunk that is “crowned” with a' \
                                 'lush umbrella of arching fronds, each 6 to 10 feet long. The pinnate (feather-like)' \
                                 'fronds have dark-green leaflets which are up to 1½ feet long and 3-4 inches wide.',
                    scientific_name: 'Archontophoenix alexandrae', origin: 'Australia',
                    instruction: 'Dig a hole. It should be at least 6 inches larger than the width of the container' \
                                 'and deep enough to cover the root ball with 2 to 3 inches of soil. About 2 to 4' \
                                 'inches of sand in the bottom of the hole will ensure proper drainage. If planting' \
                                 'multiple trees, leave at least 20 feet between each. Place your young palm in the' \
                                 'center of the hole and fill it with a mixture of 50 percent sand and 50 percent' \
                                 'original soil.')
plant12.category = trees
plant12_photo = URI.open('https://images.squarespace-cdn.com/content/v1/545cff12e4b04d921d5bbf37/1474556772761-11EVO9KISL1M9EGNRG9J/Archontophoenix+cunninghamiana.jpg?format=1500w')
plant12.photo.attach(io: plant12_photo, filename: "#{plant12.name}.png", content_type: "image/png")
plant12.save
cond12 = Condition.new(sun: '3 to 6 hours', water: 'Requires regular watering', climate: '20˚C to 35˚C')
cond12.plant = plant12
cond12.save

# Category - Aquatic
plant13 = Plant.new(name: 'Sweet Calamus, Flagroot',
                    description: 'A grass-like perennial plant with white-and-green variegated leaves up to about' \
                                 '0.5m long. An ideal focus plant, it tolerates short periods of drought. Acorus is' \
                                 'dormant in winter. It makes a good bog garden plant for pond margins.',
                    scientific_name: 'Acorus calamus "Variegatus"', origin: 'Asia, India and Europe',
                    instruction: 'It makes a good bog garden plant for pond margins, and its a good focus plant.' \
                                 'Use Acorus calamus "Variegatus" as an eye caching focus point in bog gardens or' \
                                 'moist conditions. Sweet flag tolerates short periods of drought.')
plant13.category = aquatic
plant13_photo = URI.open('https://plantinfo.co.za/wp-content/uploads/2020/07/1373999282_sf-main.jpg')
plant13.photo.attach(io: plant13_photo, filename: "#{plant13.name}.png", content_type: "image/png")
plant13.save
cond13 = Condition.new(sun: '6 to 12 hours', water: 'Requires regular watering', climate: '20˚C to 27˚C')
cond13.plant = plant13
cond13.save

plant14 = Plant.new(name: 'Creeping lily turf',
                    description: 'Excellent for mass display and colour- contrast planting. Liriope has thick' \
                                 'tuberous root systems and spread on underground rhizomes to form dense mats' \
                                 'of foliage. The green leaves are 8-18 inches long, but they tend to flop over.' \
                                 'Erect spikes of tiny white, mauve, violet, or purple flowers stand a few inches' \
                                 'above the arching foliage.',
                    scientific_name: 'Liriope spicata, "Silver Ribbon"', origin: 'Japan and China',
                    instruction: 'Liriope does best in a fertile, moist, well drained soil with a pH slightly acidic' \
                    'to neutral. It tolerates sandy as well as clayey soils, but never soil conditions that stay' \
                    'soggy. Liriope grows best in partial shade but can tolerate full sun or full shade. Once' \
                    'established, it is drought tolerant.')
plant14.category = aquatic
plant14_photo = URI.open('https://images.unsplash.com/photo-1658750103098-456ec308d183?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80')
plant14.photo.attach(io: plant14_photo, filename: "#{plant14.name}.png", content_type: "image/png")
plant14.save
cond14 = Condition.new(sun: '8 to 10 hours', water: 'Requires regular watering', climate: '20˚C to 25˚C')
cond14.plant = plant14
cond14.save

plant15 = Plant.new(name: 'Water lily',
                    description: 'Water lilies are jewels of the aquatic world. They and closely related lotus' \
                    'flowers are rooted in soil, emerging above the water surface, appearing as if floating. The' \
                    'flowers are round and centered around a radial notch. The plants are symbolic in ancient and' \
                    'modern times, celebrated for their beauty, and immortalized in art and religion.',
                    scientific_name: 'Nymphaea', origin: 'Africa',
                    instruction: 'Plant water lilies in large plastic containers or baskets specifically designed for' \
                    'aquatic plants. If necessary, you can line baskets with burlap or landscape fabric so that the' \
                    'soil does not fall through the cracks. Several sheets of newspaper can be placed on the bottom' \
                    'of containers for the same purpose.')
plant15.category = aquatic
plant15_photo = URI.open('https://images.unsplash.com/photo-1541354254661-adb801adb23e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80')
plant15.photo.attach(io: plant15_photo, filename: "#{plant15.name}.png", content_type: "image/png")
plant15.save
cond15 = Condition.new(sun: '8 to 10 hours', water: 'Must be planted in water', climate: '20˚C to 35˚C')
cond15.plant = plant15
cond15.save

plant16 = Plant.new(name: 'Sacred Lotus',
                    description: 'The Sacred Lotus in reference to the sacred and symbolic status the flower holds' \
                                'in Buddhism and Hinduism. It is native to Asia and Australia. It is a large-flowered' \
                                'lotus that typically grows 3-6" tall in shallow water and spreads by thickened' \
                                'rhizomes rooted in the mud. Each flower blooms for about three days, opening in the' \
                                'morning and closing at night each day.',
                    scientific_name: 'Nelumbo nucifera', origin: 'Asia',
                    instruction: 'Easily grown in organically rich loams in calm water margins in full sun. For' \
                    'water gardens or small ponds, plant roots in large containers or planting baskets with up to 24”' \
                    'of water covering the crowns. Container grown plants are easier to control and, if desired, to' \
                    'move to other locations.')
plant16.category = aquatic
plant16_photo = URI.open('https://images.unsplash.com/photo-1533305023562-381612b1f229?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80')
plant16.photo.attach(io: plant16_photo, filename: "#{plant16.name}.png", content_type: "image/png")
plant16.save
cond16 = Condition.new(sun: '8 to 12 hours', water: 'Must be planted in water', climate: '20˚C to 35˚C')
cond16.plant = plant16
cond16.save

# Guides
Guide.destroy_all
puts "Creating guide"
sample_document = File.read(Rails.root.join('db', 'seeds', 'How_to_plant_grass_seed.html'))
Guide.create(title: "How to plant grass seed",
             description: sample_document,
             date: "September 18, 2019",
             author: "Bertram Perry",
             image_url: "https://nualgiponds.com/wp-content/uploads/2014/04/water-garden-residential-pond-1080x745.jpg"
)

puts "Done!"
