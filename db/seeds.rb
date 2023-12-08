# seeds.rb

def random_price
  rand(50..500)
end

puts "Cleaning database"
Bookmark.destroy_all
Booking.destroy_all
Product.destroy_all
User.destroy_all

puts "Generating User"
User.create(username: "jf_vt", email: "jfvernet@icloud.com", password: "azerty")
User.create(username: "Super-Toto", email: "toto@gmail.com", password: "123456")

# Tableau de catégories possibles
categories = ['Sport', 'Déguisement', 'Pantalon', 'Jupe', 'Robe', 'Costume', 'Manteau', 'Autre']

images = [
  "https://images.asos-media.com/products/asos-design-robe-longue-asymetrique-a-sequins-argentes-noir/204472339-2?$n_320w$&wid=317&fit=constrain",
  "https://images.asos-media.com/products/amy-lynn-mimi-robe-courte-a-sequins-circulaires-style-festival-arc-en-ciel/204073306-2?$n_320w$&wid=317&fit=constrain",
  "https://images.asos-media.com/products/bershka-robe-courte-bandeau-a-volants-et-sequins-argent/205785069-2?$n_320w$&wid=317&fit=constrain",
  "https://images.asos-media.com/products/amy-jane-london-aurelia-robe-longue-en-tulle-a-sequins-noir/204842594-2?$n_320w$&wid=317&fit=constrain",
  "https://images.asos-media.com/products/labelrail-x-dyspnea-robe-longue-drapee-a-sequins-violet/205509680-2?$n_320w$&wid=317&fit=constrain"
]
sizes = ['XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL']

40.times do
  Product.create!(
    user_id: User.first.id,
    category: categories.sample,
    size: sizes.sample,
    price: random_price,
    title: Faker::Lorem.words(number: 3).join(' '),
    description: Faker::Lorem.sentence,
    availability: [true, false].sample,
    sexe: ["Femme", "Homme", "Enfant"].sample,
    textile_type: ['Laine', 'Coton', 'Soie', 'Lin', 'Synthétique', 'Plastique', 'Acier', 'Autre'].sample,
    couleurs: ["rouge", "bleu", "jaune", "Vert", "Blanc", "Noir", "Gris", "Autre"].sample,
    image: images.sample
  )
end

puts "Seed completed"
