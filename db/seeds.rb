# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
def random_price
  rand(50..500)
end

puts "cleaning database"
Booking.destroy_all
Product.destroy_all
User.destroy_all


puts "generating User"
User.create(username: "jf_vt", email: "jfvernet@icloud.com", password: "azerty")

# Tableau de catégories possibles
categories = ["robe de mariée", "pantalon", "pull", "costumes"]

images = ["https://images.asos-media.com/products/asos-design-robe-longue-asymetrique-a-sequins-argentes-noir/204472339-2?$n_320w$&wid=317&fit=constrain", "https://images.asos-media.com/products/amy-lynn-mimi-robe-courte-a-sequins-circulaires-style-festival-arc-en-ciel/204073306-2?$n_320w$&wid=317&fit=constrain", "https://images.asos-media.com/products/bershka-robe-courte-bandeau-a-volants-et-sequins-argent/205785069-2?$n_320w$&wid=317&fit=constrain", "https://images.asos-media.com/products/amy-jane-london-aurelia-robe-longue-en-tulle-a-sequins-noir/204842594-2?$n_320w$&wid=317&fit=constrain", "https://images.asos-media.com/products/labelrail-x-dyspnea-robe-longue-drapee-a-sequins-violet/205509680-2?$n_320w$&wid=317&fit=constrain"]

# Création de 20 instances de produits
20.times do
  Product.create!(
    user: user, # Remplace 1 par l'ID de l'utilisateur approprié
    puts "Generating products"
# Création de 20 instances de produits
20.times do
  Product.create!(
    user_id: User.first.id, # Remplcategory: categories.sample,
    size: rand(1..5), # Remplace 5 par le nombre maximum de tailles possible
    price: random_price,
    title: Faker::Lorem.words(number: 3).join(' '), # Utilisation de Faker pour générer un titre aléatoire
    description: Faker::Lorem.sentence,
    availability: [true, false].sample,
    image_url: images.sample,
  )
end
