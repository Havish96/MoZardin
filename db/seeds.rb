require "open-uri"

puts 'Destroying all Conditions'
Condition.destroy_all
puts 'Destroying all Tags'
Tag.destroy_all
puts "Destroying all Tasks"
Task.destroy_all
puts "Destroying all Plants"
Plant.destroy_all
puts 'Destroying all Categories'
Category.destroy_all
puts 'Destroying all Gardens'
Garden.destroy_all

puts "Creating 4 categories"
fruits = Category.create(name: "Fruits & Vegetables",
                         description: "Botanically, fruits and vegetables are classified depending on which part of" \
                                      " the plant they come from. A fruit develops from the flower of a plant, while" \
                                      " other parts of the plant are categorized as vegetables. Fruits contain seeds," \
                                      " while vegetables can consist of roots, stems and leaves.")
fruits_photo = URI.open('https://images.unsplash.com/photo-1445282768818-728615cc910a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
fruits.photo.attach(io: fruits_photo, filename: "#{fruits.name}.png", content_type: "image/png")
fruits.save

herbs = Category.create(name: 'Herbs',
                        description: "In general use, herbs are a widely distributed and widespread group of plants," \
                                     " excluding vegetables and other plants consumed for macronutrients, with savory" \
                                     " or aromatic properties that are used for flavoring and garnishing food, for" \
                                     " medicinal purposes, or for fragrances.")
herbs_photo = URI.open('https://images.unsplash.com/photo-1532092367580-3bd5bc78dd9d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
herbs.photo.attach(io: herbs_photo, filename: "#{herbs.name}.png", content_type: "image/png")
herbs.save

trees = Category.create(name: 'Trees',
                        description: "A tree is a tall plant that can live for a very long time. It has a single stem" \
                                     " or trunk and branches that support leaves. Beneath the ground, a tree has a" \
                                     " root system that acts as an anchor and stores the water and nutrients the plant" \
                                     " needs to grow.")
trees_photo = URI.open('https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80')
trees.photo.attach(io: trees_photo, filename: "#{trees.name}.png", content_type: "image/png")
trees.save

aquatic = Category.create(name: 'Water & Aquatic',
                          description: "Aquatic plants are plants that have adapted to living in aquatic environments" \
                                       " (saltwater or freshwater). They are also referred to as hydrophytes or" \
                                       " macrophytes to distinguish them from algae and other microphytes. A" \
                                       " macrophyte is a plant that grows in or near water and is either emergent," \
                                       " submergent, or floating.")
aquatic_photo = URI.open('https://images.unsplash.com/photo-1490772888775-55fceea286b8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')
aquatic.photo.attach(io: aquatic_photo, filename: "#{aquatic.name}.png", content_type: "image/png")
aquatic.save

climbers = Category.create(name: 'Climbers & Creepers Shrubs',
                          description: "This is a very popular ornamental tree in subtropical and tropical climates,"\
                                       "grown for its scented flowers and also used as a food item in Indian cuisine.")



puts "Creating 20 plants ..."

# Category - Fruits & Vegetables
plant1 = Plant.new(name: 'Tomato',
                   description: "The tomato is the most popular and versatile vegetable grown worldwide. It is a" \
                                " warm-season crop that needs about a three-month growing season to reach" \
                                " fruit-producing stage.",
                   scientific_name: 'Lycopersicon esculentum', origin: 'South America',
                   instruction: "Plant seedlings in open beds when they are 100-120mm tall. Seedlings of tall-growing" \
                                " hybrids can be planted 500mm apart in the row.")
plant1.category = fruits
plant1_photo = URI.open('https://freepngimg.com/thumb/tomato/6-tomato-png-image.png')
plant1.photo.attach(io: plant1_photo, filename: "#{plant1.name}.png", content_type: "image/png")
plant1.save
cond1 = Condition.new(sun: 'min 6hrs', water: 'Regular', climate: '10-38˚C')
cond1.plant = plant1
cond1.save
puts "created Tomato"

plant2 = Plant.new(name: 'Cucumber',
                   description: "When grown naturally outdoors, cucumbers are warm-season vegetables that utilize" \
                                " crosspollination to produce fruits. Fruits should be ready for picking 8-10 weeks" \
                                " after sowing. Pick regularly, before the pips start to harden. Cucumbers are used in" \
                                " salads and sandwich fillings.",
                   scientific_name: 'Cucumis sativus', origin: 'India',
                   instruction: "Cucumber can be grown up fences, over pergolas, up sunflower stalks, and love to be" \
                                " near beans, radishes and green peppers. Also, they release a root secretion" \
                                " which inhibits weeds. They are creeping vines that generally need a trellis or" \
                                " supporting frame, but can also be grown in rows or basins 300mm across and ±1m apart.")
plant2.category = fruits
plant2_photo = URI.open('https://purepng.com/public/uploads/large/purepng.com-cucumbercucumbervegetablespicklegreenfoodhealthycucumbers-481522161925n6wbx.png')
plant2.photo.attach(io: plant2_photo, filename: "#{plant2.name}.png", content_type: "image/png")
plant2.save
cond2 = Condition.new(sun: 'min 6hrs', water: 'Regular', climate: '23-30˚C')
cond2.plant = plant2
cond2.save
puts "created Cucumber"

plant3 = Plant.new(name: 'Strawberry',
                   description: "Strawberries are very adaptable and will grow everywhere, although the flavour" \
                                " is best in cooler climates. Ideal for small gardens, as they need little space and" \
                                " can be grown in containers. Always buy plants certified as virus-free.",
                   scientific_name: 'Fragaria x ananassa', origin: 'Northen Europe',
                   instruction: "Plant 250mm apart in rows, leaving 600mm between rows. Plant in autumn to ensure a" \
                   " good crop in early summer. use compost- enriched soil and mulch to preserve soil moisture. Water" \
                   " regularly and feed once a month with liquid fertilizer during the active growing season.")
plant3.category = fruits
plant3_photo = URI.open('https://static.vecteezy.com/system/resources/previews/008/848/372/original/fresh-red-strawberry-fruit-free-png.png')
plant3.photo.attach(io: plant3_photo, filename: "#{plant3.name}.png", content_type: "image/png")
plant3.save
cond3 = Condition.new(sun: '8-10hrs', water: 'Regular', climate: '12-27˚C')
cond3.plant = plant3
cond3.save
puts "created Strawberry"

plant4 = Plant.new(name: 'Pumpkin',
                   description: "Pumpkins, squash, marrows and courgettes (baby marrows) all fall into the same" \
                                " group of easy-to grow, warm-season crops. Pumpkins are rampant growers and not ideal" \
                                " for smaller gardens as they take up too much space. The flowers are also edible and" \
                                " can be added to dishes as flavouring.",
                   scientific_name: 'Cucurbita maxima', origin: 'North and South America',
                   instruction: 'For pumpkins, plant six to eight seeds 20mm deep in soil basins 300mm in diameter' \
                   ' and 2m apart; well-enriched soil with good drainage is best. Plant near mealies, beans and' \
                   ' radishes. also plant garlic and chives near them, this helps with mildew.')
plant4.category = fruits
plant4_photo = URI.open('https://www.freepnglogos.com/uploads/pumpkin-png/pumpkin-pumpkins-westmoreland-berry-farm-0.png')
plant4.photo.attach(io: plant4_photo, filename: "#{plant4.name}.png", content_type: "image/png")
plant4.save
cond4 = Condition.new(sun: '6-8hrs', water: 'Regular', climate: '19-35˚C')
cond4.plant = plant4
cond4.save
puts "created Pumpkin"

# Category - Herbs
plant5 = Plant.new(name: 'Garlic',
                   description: 'A perennial plant, consisting of a clump of flat leaves, round pinkish flowerheads' \
                                ' and a compound bulb divided into cloves, each covered in a white or mottled purple,' \
                                ' parchment-like skin. It is a close relative of the onion. Garlic is a natural' \
                                ' antibiotic, an antiseptic, a blood tonic, toner and cleanser.',
                   scientific_name: 'Allium sativum', origin: 'Eurasia, Siberia and North America.',
                   instruction: 'Press individual cloves 30mm deep into well-prepared soil and space them about 80mm' \
                                ' apart. This plant relies on well-prepared soil. Seed can be sown in trays filled' \
                                ' with sand in spring or autumn. Keep moist and protected until strong enough to handle')
plant5.category = herbs
plant5_photo = URI.open('https://pngimg.com/d/garlic_PNG12775.png')
plant5.photo.attach(io: plant5_photo, filename: "#{plant5.name}.png", content_type: "image/png")
plant5.save
cond5 = Condition.new(sun: '8-10hrs', water: 'Regular', climate: '5-15˚C')
cond5.plant = plant5
cond5.save
puts "created Garlic"

plant6 = Plant.new(name: 'Coriander',
                   description: 'One of the top five favourite spices in the world. An annual herb with dark green,' \
                                ' parsley-like leaves and small white or purplish-tinged flowers. The leaves, which' \
                                ' have a distinctive taste, are known by various culinary terms, including coriander,' \
                                ' dhania, cilantro and Chinese parsley. An annual herb with dark green, parsley-like' \
                                ' leaves',
                   scientific_name: 'Coriandrum sativum', origin: 'Eastern Mediterranean',
                   instruction: 'Sow in a sunny spot. Seed formation in coriander is hindered by proximity to fennel,' \
                                ' so don\'t grow these plants near each other. It can be placed in a large pot on a' \
                                ' veranda or patio.')
plant6.category = herbs
plant6_photo = URI.open('https://assets.stickpng.com/images/58bf1e87e443f41d77c734b6.png')
plant6.photo.attach(io: plant6_photo, filename: "#{plant6.name}.png", content_type: "image/png")
plant6.save
cond6 = Condition.new(sun: '5-10hrs', water: 'Regular', climate: '17-28˚C')
cond6.plant = plant6
cond6.save
puts "created Coriander"

plant7 = Plant.new(name: 'Peppermint',
                   description: 'A spreading perennial herb with dark green leaves and reddish stems. The leaves are' \
                                ' excellent for flavouring ice-creams, chocolate desserts and cakes. Commercially' \
                                ' extracted peppermint oil is used to flavour confectionery.',
                   scientific_name: 'Mentha x piperita', origin: 'Europe, Northen Africa, North America and Australia',
                   instruction: 'Peppermint is an incredibly adaptable plant, but ideally it prefers a cool, moist' \
                                ' climate with well-draining, loose, organically-rich soil. Keep the area around your' \
                                ' mint free of weeds.')
plant7.category = herbs
plant7_photo = URI.open('https://www.pngarts.com/files/1/Peppermint-PNG-Picture.png')
plant7.photo.attach(io: plant7_photo, filename: "#{plant7.name}.png", content_type: "image/png")
plant7.save
cond7 = Condition.new(sun: '2-5hrs', water: 'Regular', climate: '12-22˚C')
cond7.plant = plant7
cond7.save
puts "created Peppermint"

plant8 = Plant.new(name: 'Thyme',
                   description: 'A woody, low-growing plant with stiff stems covered in strongly aromatic, small,' \
                                ' oval greygreen leaves. It has small clusters of lilac flowers. A popular culinary' \
                                ' herb, used in stews for its strong delicious flavour. Thymol oil, can be used to' \
                                ' chase fleas, flies, mosquitoes and ants. It is also used for perfumes and medicines.',
                   scientific_name: 'Thymus vulgaris', origin: 'Mediterranean regions',
                   instruction: ' Ideal for pots in full sun. Thyme planted along pathways and around vegetable' \
                                ' gardens, keeps out insects.')
plant8.category = herbs
plant8_photo = URI.open('https://assets.stickpng.com/images/58bf1e33e443f41d77c734ac.png')
plant8.photo.attach(io: plant8_photo, filename: "#{plant8.name}.png", content_type: "image/png")
plant8.save
cond8 = Condition.new(sun: '8-12hrs', water: 'Regular', climate: '20-32˚C')
cond8.plant = plant8
cond8.save
puts "created Thyme"

# Category - Trees
plant9 = Plant.new(name: 'Baobab',
                   description: 'This extraordinary tree, from the drier northern parts of South Africa, looks as' \
                                ' if it has been planted upside down. It bears waxy white flowers which are followed' \
                                ' by large, egg-shaped fruits covered in fine hair. The short-lived flowers open in' \
                                ' the late afternoon and decline within 24 hours. Baobabs are notable for their huge' \
                                ' trunk circumference and heavily folded bark, in shades of grey and reddish brown',
                   scientific_name: 'Adansonia digitata', origin: 'Southern Africa',
                   instruction: 'These trees work well as accent plants for large gardens in warmer areas.' \
                                ' Unfortunately, these trees are quite rare.')
plant9.category = trees
plant9_photo = URI.open('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8d701ac9-5f2f-46b0-bcd4-603768c2c88f/ddaexar-864a964e-c17e-4300-a6d6-77b68fcbe0db.png/v1/fill/w_800,h_579,strp/baobab_tree_png_4_by_gareng92_ddaexar-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTc5IiwicGF0aCI6IlwvZlwvOGQ3MDFhYzktNWYyZi00NmIwLWJjZDQtNjAzNzY4YzJjODhmXC9kZGFleGFyLTg2NGE5NjRlLWMxN2UtNDMwMC1hNmQ2LTc3YjY4ZmNiZTBkYi5wbmciLCJ3aWR0aCI6Ijw9ODAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.kAw-3wG6uUgACfbHYWVbh4GUGNy6faEGkMOrSHhqJX4')
plant9.photo.attach(io: plant9_photo, filename: "#{plant9.name}.png", content_type: "image/png")
plant9.save
cond9 = Condition.new(sun: '8-12hrs', water: 'Moderate', climate: '14-35˚C')
cond9.plant = plant9
cond9.save
puts "created Baobab"

plant10 = Plant.new(name: 'Flamboyant',
                    description: 'Only suitable for the warmer areas of the country and for very large gardens. A' \
                                 ' magnificent, flowering shade tree with a large, flat top that is covered with' \
                                 ' striking, orange-red flowers in summer.',
                    scientific_name: 'Delonix regia', origin: 'Madagascar',
                    instruction: 'Flame trees are propagated from seed. Let the dry seeds swell in lukewarm water' \
                                 ' for a few days before you put them in cultivation soil. Keep them at a steady' \
                                 ' temperature of 68° F / 20°C. It will take three weeks until the seeds germinate.')
plant10.category = trees
plant10_photo = URI.open('https://www.seekpng.com/png/full/989-9899063_flamboyant-trees-tree-red-flowers-nature-flame-tree.png')
plant10.photo.attach(io: plant10_photo, filename: "#{plant10.name}.png", content_type: "image/png")
plant10.save
cond10 = Condition.new(sun: '8-12hrs', water: 'Regular', climate: '20-30˚C')
cond10.plant = plant10
cond10.save
puts "created Flamboyant"

plant11 = Plant.new(name: 'Pod Mahogany',
                    description: 'A handsome tree with a spreading crown. Sprays of pinkish-red flowers appear in' \
                                 ' early summer, followed by large, woody pods with attractive seeds. Tolerates' \
                                 ' salt-laden winds.',
                    scientific_name: 'Afzelia quanzensis', origin: 'Southern Africa',
                    instruction: 'Plant mahogany in full sun with plenty of room to spread. They are highly salt' \
                                 ' and drought tolerant and do well in coastal areas. Mahoganies grow to become large' \
                                 ' trees with aggressive roots. Generally, plant them no closer than 20 feet from' \
                                 ' permanent structures and 5 to 6 feet from sidewalks and curbs.')
plant11.category = trees
plant11_photo = URI.open('https://www.featheredaddictions.com/assets/images/be716551-5e6e-4914-b2a6-8bfe2f5c029d_clipped_rev_1.png')
plant11.photo.attach(io: plant11_photo, filename: "#{plant11.name}.png", content_type: "image/png")
plant11.save
cond11 = Condition.new(sun: '8-12hrs', water: 'Moderate', climate: '20-30˚C')
cond11.plant = plant11
cond11.save
puts "created Pod Mohagany"

plant12 = Plant.new(name: 'Alexandra palm, king palm',
                    description: 'The King Palm has a solitary, smooth, light-grey trunk that is “crowned” with a' \
                                 ' lush umbrella of arching fronds, each 6 to 10 feet long. The pinnate (feather-like)' \
                                 ' fronds have dark-green leaflets which are up to 1½ feet long and 3-4 inches wide.',
                    scientific_name: 'Archontophoenix alexandrae', origin: 'Australia',
                    instruction: 'Dig a hole. It should be at least 6 inches larger than the width of the container' \
                                 ' and deep enough to cover the root ball with 2 to 3 inches of soil. About 2 to 4' \
                                 ' inches of sand in the bottom of the hole will ensure proper drainage. If planting' \
                                 ' multiple trees, leave at least 20 feet between each. Place your young palm in the' \
                                 ' center of the hole and fill it with a mixture of 50 percent sand and 50 percent' \
                                 ' original soil.')
plant12.category = trees
plant12_photo = URI.open('https://t4.ftcdn.net/jpg/05/45/43/21/360_F_545432118_g4tGW0iNZ0Idx7y4rP5Im9O40XiUjB6H.png')
plant12.photo.attach(io: plant12_photo, filename: "#{plant12.name}.png", content_type: "image/png")
plant12.save
cond12 = Condition.new(sun: '3-6hrs', water: 'Regular', climate: '20-35˚C')
cond12.plant = plant12
cond12.save
puts "created King Palm"

# Category - Aquatic
plant13 = Plant.new(name: 'Sweet Calamus',
                    description: 'A grass-like perennial plant with white-and-green variegated leaves up to about' \
                                 ' 0.5m long. An ideal focus plant, it tolerates short periods of drought. Acorus is' \
                                 ' dormant in winter. It makes a good bog garden plant for pond margins.',
                    scientific_name: 'Acorus calamus "Variegatus"', origin: 'Asia, India and Europe',
                    instruction: 'It makes a good bog garden plant for pond margins, and its a good focus plant.' \
                                 ' Use Acorus calamus "Variegatus" as an eye caching focus point in bog gardens or' \
                                 ' moist conditions. Sweet flag tolerates short periods of drought.')
plant13.category = aquatic
plant13_photo = URI.open('http://cdn.shopify.com/s/files/1/0245/3785/8100/products/vekhand-removebg-preview.png?v=1656400277')
plant13.photo.attach(io: plant13_photo, filename: "#{plant13.name}.png", content_type: "image/png")
plant13.save
cond13 = Condition.new(sun: '6-12hrs', water: 'Regular', climate: '20-27˚C')
cond13.plant = plant13
cond13.save
puts "created Sweet Calamus"

plant14 = Plant.new(name: 'Creeping lily turf',
                    description: 'Excellent for mass display and colour- contrast planting. Liriope has thick' \
                                 ' tuberous root systems and spread on underground rhizomes to form dense mats' \
                                 ' of foliage. The green leaves are 8-18 inches long, but they tend to flop over.' \
                                 ' Erect spikes of tiny white, mauve, violet, or purple flowers stand a few inches' \
                                 ' above the arching foliage.',
                    scientific_name: 'Liriope spicata, "Silver Ribbon"', origin: 'Japan and China',
                    instruction: 'Liriope does best in a fertile, moist, well drained soil with a pH slightly acidic' \
                    ' to neutral. It tolerates sandy as well as clayey soils, but never soil conditions that stay' \
                    ' soggy. Liriope grows best in partial shade but can tolerate full sun or full shade. Once' \
                    ' established, it is drought tolerant.')
plant14.category = aquatic
plant14_photo = URI.open('https://cdn.shopify.com/s/files/1/0557/1792/0934/products/Big-Blue-Liriope-Pot-500-removebg-preview_195x195@2x.png?v=1623995030')
plant14.photo.attach(io: plant14_photo, filename: "#{plant14.name}.png", content_type: "image/png")
plant14.save
cond14 = Condition.new(sun: '8-10hrs', water: 'Regular', climate: '20-25˚C')
cond14.plant = plant14
cond14.save
puts "created Creeping Lily"

plant15 = Plant.new(name: 'Water lily',
                    description: 'Water lilies are jewels of the aquatic world. They and closely related lotus' \
                    ' flowers are rooted in soil, emerging above the water surface, appearing as if floating. The' \
                    ' flowers are round and centered around a radial notch. The plants are symbolic in ancient and' \
                    ' modern times, celebrated for their beauty, and immortalized in art and religion.',
                    scientific_name: 'Nymphaea', origin: 'Africa',
                    instruction: 'Plant water lilies in large plastic containers or baskets specifically designed for' \
                    ' aquatic plants. If necessary, you can line baskets with burlap or landscape fabric so that the' \
                    ' soil does not fall through the cracks. Several sheets of newspaper can be placed on the bottom' \
                    ' of containers for the same purpose.')
plant15.category = aquatic
plant15_photo = URI.open('https://www.pikpng.com/pngl/b/85-850710_pink-water-lily-png-clipart-image-water-lily.png')
plant15.photo.attach(io: plant15_photo, filename: "#{plant15.name}.png", content_type: "image/png")
plant15.save
cond15 = Condition.new(sun: '8-10hrs', water: 'Aquatic', climate: '20-35˚C')
cond15.plant = plant15
cond15.save
puts "created Water lily"

plant16 = Plant.new(name: 'Sacred Lotus',
                    description: 'The Sacred Lotus in reference to the sacred and symbolic status the flower holds' \
                                ' in Buddhism and Hinduism. It is native to Asia and Australia. It is a large-flowered' \
                                ' lotus that typically grows 3-6" tall in shallow water and spreads by thickened' \
                                ' rhizomes rooted in the mud. Each flower blooms for about three days, opening in the' \
                                ' morning and closing at night each day.',
                    scientific_name: 'Nelumbo nucifera', origin: 'Asia',
                    instruction: 'Easily grown in organically rich loams in calm water margins in full sun. For' \
                    ' water gardens or small ponds, plant roots in large containers or planting baskets with up to 24”' \
                    ' of water covering the crowns. Container grown plants are easier to control and, if desired, to' \
                    ' move to other locations.')
plant16.category = aquatic
plant16_photo = URI.open('https://pngimg.com/uploads/lotus_flower/lotus_flower_PNG47.png')
plant16.photo.attach(io: plant16_photo, filename: "#{plant16.name}.png", content_type: "image/png")
plant16.save
cond16 = Condition.new(sun: '8-12hrs', water: 'Aquatic', climate: '20-35˚C')
cond16.plant = plant16
cond16.save
puts "created Lotus"

plant17= Plant.new(name:'orchid-tree',
                   description: 'This species bears compound foliage consisting of only 2 broad leaflets and flowers '\
                                'have 5 petals and are in shades of red, pink, purple, orange, or yellow, and are often fragrant.'\
                                ' It is often slow growing and do not like being transplanted. '\
                                'They prefer acidic soils, and full sun but can be grown in partial sun.',

                   scientific_name: 'Bauhina variegata', origin: ' Southeast Asia',
                   instruction: 'They are fast growers, but can be trimmed to suit your garden, either as a single-trunk standard,'\
                                'Bauhinia needs to be scarified and soaked in warm water for 24 hours prior to sowing.'\
                                ' Most of the year, this is not a messy tree, but when the pods fall, they drop straight down, best over a lawn or sidewalk where cleanup is easy.')

plant17.category= climbers
plant17_photo= URI.open('https://th.bing.com/th/id/R.87132d478eabaed5dd8e27848a3f52b8?rik=9xBruc66FGj57g&riu=http%3a%2f%2f2.bp.blogspot.com%2f-Kp3Num0OczQ%2fVOMoOv8ZfzI%2fAAAAAAAAPAc%2fOeTUfW2AGHc%2fs1600%2f0_56f46_2ee01ef1_orig.png&ehk=jwGPjXfT1XOScdmvaLL385tVsbkahFqizvPQnFx5o%2fg%3d&risl=&pid=ImgRaw&r=0')
plant17.photo.attach(io: plant17_photo, filename: "#{plant17.name}.png", content_type: "image/png")
plant17.save
cond17 = Condition.new(sun: '8-12hrs', water: 'Regular', climate: '15-25˚C')
cond17.plant = plant17
cond17.save
puts "created orchid-tree"

plant18= Plant.new(name:'Calico Flower',
  description: 'Native to South America, Calico flower is a tender evergreen vine with very unusual flowers. Leaves are beautiful, bright green heart shaped. '\
               'These are about 3 in long by 2 in wide and grow closely together to create a dense mass of foliage.'\
               ' Bright green leaves are usually evergreen and the vining stems become quite woody with age. Flowers are solitary and quite large, for a pipevine',


  scientific_name: 'Aristolochia Littoralis', origin: 'Brazil',
  instruction: 'They are fast growers, but can be trimmed to suit your garden, either as a single-trunk standard,'\
               'Bauhinia needs to be scarified and soaked in warm water for 24 hours prior to sowing.'\
               ' Most of the year, this is not a messy tree, but when the pods fall, they drop straight down, best over a lawn or sidewalk where cleanup is easy.')


plant18.category= climbers
plant18_photo= URI.open('https://th.bing.com/th/id/OIP.ZZaXCMe7yiZDfXJLZ2O3-QHaGF?pid=ImgDet&rs=1')
plant18.photo.attach(io: plant18_photo, filename: "#{plant18.name}.png", content_type: "image/png")
plant18.save
cond18 = Condition.new(sun: '9-12hrs', water: 'Regular', climate: '10-15˚C')
cond18.plant = plant18
cond18.save
puts "created calico flower"

plant19= Plant.new(name:'Sweet Pea',
  description: ' Sweet peas are one of the joys of the winter garden, particularly in cooler or more temperate areas. Seed companies offer both climbing and bush (dwarf) varieties,'\
               ' as well as packets of single-colour flowers in a range of hues: dark purple, maroon, pink, rose, salmon, blue and white. Sweet peas make lovely scented cut flowers.'\
               'These climbers and semi-climbers need something to grow on or against, so put a trellis in place or install criss-cross wires against a wall, to give them something to wind around. ',


  scientific_name: ' Lathyrus Odoratus', origin: 'Italy',
  instruction: 'Choose a sunny north- or east-facing position for your bed and prepare the soil well in advance of planting, as sweet peas are gross (heavy) feeders.'\
               'It is not necessary to dig a huge trench, but it should be Â±250mm deep and wide. When removing soil from the trench, remember to put the topsoil on one side and the bottom soil on another.'\
               'Work a lot of well-rotted manure and compost into the bottom soil, plus a cup of superphosphate for each running metre of trench.'\
               'Next, mix compost and well-rotted manure into topsoil, adding half a cup of 3:2:1 (28) SR fertilizer for each metre of trench. This should be done a month in advance of planting. In the week before sowing, rake a sprinkling of lime into the trenches.')



plant19.category= climbers
plant19_photo= URI.open('https://th.bing.com/th/id/OIP.ZZaXCMe7yiZDfXJLZ2O3-QHaGF?pid=ImgDet&rs=1')
plant19.photo.attach(io: plant19_photo, filename: "#{plant19.name}.png", content_type: "image/png")
plant19.save
cond19 = Condition.new(sun: '6-12hrs', water: 'Aquatic', climate: '10-15˚C')
cond19.plant = plant19
cond19.save
puts "created Sweet Pea"

plant20= Plant.new(name:'Formosa',
  description: 'Bougainvilleas are among the most spectacular and colourful of all climbers, with dozens of cultivars available.'\
               'They come in shades of white, pink, red, orange, lilac, purple, cerise and copper; there is even one with pink and white flowers on the same plant.'\
               'There are also a number of double varieties, plus some with variegated leaves. These colourful charmers are handy for'\
               'a variety of functions, from covering walls and pergolas to being used as ground covers, specimen plants and tub subjects.'\
               'They are very vigorous, heavy and thorny, and the stronger growers need stout support.',
  scientific_name: 'Bougainvillea Cultivars', origin: 'Southwestern China',
  instruction: 'They are fast growers, but can be trimmed to suit your garden, either as a single-trunk standard,'\
               'Bauhinia needs to be scarified and soaked in warm water for 24 hours prior to sowing.'\
               ' Most of the year, this is not a messy tree, but when the pods fall, they drop straight down, best over a lawn or sidewalk where cleanup is easy.')


plant20.category= climbers
plant20_photo= URI.open('https://th.bing.com/th/id/OIP.ZZaXCMe7yiZDfXJLZ2O3-QHaGF?pid=ImgDet&rs=1')
plant20.photo.attach(io: plant20_photo, filename: "#{plant20.name}.png", content_type: "image/png")
plant20.save
cond20 = Condition.new(sun: '9-12hrs', water: 'Regular', climate: '10-15˚C')
cond20.plant = plant20
cond20.save
puts "created Formosa"




# Guides
Guide.destroy_all
puts "Creating guide"
sample_document = File.read(Rails.root.join('db', 'seeds', 'How_to_plant_grass_seed.html'))
Guide.create(title: "How to plant grass seed",
             description: sample_document,
             date: "September 18, 2019",
             author: "Bertram Perry",
             image_url: "https://nualgiponds.com/wp-content/uploads/2014/04/water-garden-residential-pond-1080x745.jpg")

# messages
puts 'Destroying messages'
Message.destroy_all
# Chatrooms
Chatroom.destroy_all
puts "Creating Chatrooms"
Chatroom.create(name: "General")
Chatroom.create(name: "Help")

puts "Done!"
