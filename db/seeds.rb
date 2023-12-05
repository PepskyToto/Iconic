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

# Tableau de catégories possibles
categories = ["robe de mariée", "pantalon", "pull", "costumes"]

# Création de 20 instances de produits
20.times do
  Product.create!(
    user_id: 1, # Remplace 1 par l'ID de l'utilisateur approprié
    category: categories.sample,
    size: rand(1..5), # Remplace 5 par le nombre maximum de tailles possible
    price: random_price,
    title: Faker::Lorem.words(number: 3).join(' '), # Utilisation de Faker pour générer un titre aléatoire
    description: Faker::Lorem.sentence,
    availability: [true, false].sample
  )
end