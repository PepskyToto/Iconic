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
Bookmark.destroy_all
Booking.destroy_all
Product.destroy_all
User.destroy_all
puts "generating User"
User.create(username: "jf_vt", email: "jfvernet@icloud.com", password: "azerty")
User.create(username: "Super-Toto", email: "toto@gmail.com", password: "123456")
# Tableau de catégories possibles
# categories = ['Sport', 'Déguisement', 'Pantalon', 'Jupe', 'Robe', 'Costume', 'Manteau', 'Autre']
# images_sport = ['https://cdn.fabletics.com/media/images/products/FL231202/FL231202-2_577x866.jpg?t=1700615709200','https://cdn.fabletics.com/media/images/products/FL231215/FL231215-2_577x866.jpg?t=1700006682273', 'https://cdn.fabletics.com/media/images/products/FL231105/FL231105-2_577x866.jpg?t=1697469349681']
# images = ["https://images.asos-media.com/products/asos-design-robe-longue-asymetrique-a-sequins-argentes-noir/204472339-2?$n_320w$&wid=317&fit=constrain", "https://images.asos-media.com/products/amy-lynn-mimi-robe-courte-a-sequins-circulaires-style-festival-arc-en-ciel/204073306-2?$n_320w$&wid=317&fit=constrain", "https://images.asos-media.com/products/bershka-robe-courte-bandeau-a-volants-et-sequins-argent/205785069-2?$n_320w$&wid=317&fit=constrain", "https://images.asos-media.com/products/amy-jane-london-aurelia-robe-longue-en-tulle-a-sequins-noir/204842594-2?$n_320w$&wid=317&fit=constrain", "https://images.asos-media.com/products/labelrail-x-dyspnea-robe-longue-drapee-a-sequins-violet/205509680-2?$n_320w$&wid=317&fit=constrain"]
# sizes = ['XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL']
# # title = ['Robe', 'Robe de coktail']
# # description = ["Parfait pour une soirée mondaine", "Pour sortir tous les jours", "S/'habiller avec élégance"]
# 40.times do
#   Product.create!(
#     user_id: User.first.id,
#     category: categories.sample,
#     size: sizes.sample, # Remplace 5 par le nombre maximum de tailles possible
#     price: random_price,
#     # title: Faker::Lorem.words(number: 3).join(' '), # Utilisation de Faker pour générer un titre aléatoire
#     title: ['Robe', 'Robe de coktail'].sample,
#     # description: Faker::Lorem.sentence,
#     description: ["Parfait pour une soirée mondaine", "Pour sortir tous les jours", "S/'habiller avec élégance"].sample,
#     availability: [true, false].sample,
#     sexe: ["Femme", "Homme", "Enfant"].sample,
#     textile_type: ['Laine', 'Coton', 'Soie', 'Lin', 'Synthétique', 'Plastique', 'Acier', 'Autre'].sample,
#     couleurs: ["rouge", "bleu", "jaune", "Vert", "Blanc", "Noir", "Gris", "Autre"].sample,
#     image: images.sample,
#   )
# end
# Tableau de catégories possibles
categories = ['Sport', 'Déguisement', 'Pantalon', 'Jupe', 'Robe', 'Costume', 'Manteau', 'Autre']
# Tableaux d'images par catégorie
images_sport = [
  'https://cdn.fabletics.com/media/images/products/FL231202/FL231202-2_577x866.jpg?t=1700615709200',
  'https://cdn.fabletics.com/media/images/products/FL231215/FL231215-2_577x866.jpg?t=1700006682273',
  'https://cdn.fabletics.com/media/images/products/FL231105/FL231105-2_577x866.jpg?t=1697469349681'
]
images_deguisement = [
  'https://faites-lafete.com/16662-large_default/deguisements-sirenes-et-poseidon-adulte-femme-.jpg',
  'https://faites-lafete.com/22091-large_default/deguisements-oriantal-adulte-femme-.jpg',
  'https://faites-lafete.com/23859-home_default/deguisement-robe-americaine-femme.jpg'
]
images_pantalon = [
  'https://images.asos-media.com/products/stradivarius-petite-pantalon-droit-ajuste-noir/205393571-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/adidas-originals-adibreak-bas-de-survetement-avec-boutons-pression-sur-les-cotes-noir/203517963-2?$n_320w$&wid=317&fit=constrain'
]
images_jupe = [
  'https://images.asos-media.com/products/asos-design-mini-jupe-plissee-noir/204584298-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/asos-design-jupe-longue-en-satin-a-coupe-en-biais-noir/205288519-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/asos-design-jupe-crayon-mi-longue-a-taille-haute-noir/203358429-2?$n_320w$&wid=317&fit=constrain'
]
images_robe = [
  "https://images.asos-media.com/products/asos-design-robe-longue-asymetrique-a-sequins-argentes-noir/204472339-2?$n_320w$&wid=317&fit=constrain",
  "https://images.asos-media.com/products/amy-lynn-mimi-robe-courte-a-sequins-circulaires-style-festival-arc-en-ciel/204073306-2?$n_320w$&wid=317&fit=constrain",
  "https://images.asos-media.com/products/bershka-robe-courte-bandeau-a-volants-et-sequins-argent/205785069-2?$n_320w$&wid=317&fit=constrain",
  "https://images.asos-media.com/products/amy-jane-london-aurelia-robe-longue-en-tulle-a-sequins-noir/204842594-2?$n_320w$&wid=317&fit=constrain",
  "https://images.asos-media.com/products/labelrail-x-dyspnea-robe-longue-drapee-a-sequins-violet/205509680-2?$n_320w$&wid=317&fit=constrain"
]
images_costume_homme = [
  'https://images.asos-media.com/products/asos-design-pantalon-de-costume-ajuste-noir/202491401-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/viggo-pantalon-de-costume-a-damier-vert/205001178-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/selected-homme-pantalon-de-costume-coupe-slim-vert-fonce/204764828-2?$n_320w$&wid=317&fit=constrain'
]
images_manteau = [
  'https://images.asos-media.com/products/asos-design-duffle-coat-oversize-taupe/205026339-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/bershka-trench-coat-en-laine-camel/205822352-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/bershka-trench-coat-en-laine-noir/205581865-2?$n_320w$&wid=317&fit=constrain'
]
images_autre_femme = [
  'https://images.asos-media.com/products/asos-design-lunettes-de-soleil-carrees-a-motif-ecaille-de-tortue/201298388-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/valentino-bags-vancouver-sac-porte-epaule-gris-acier/204788791-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/forever-new-pochette-a-strass-dore-doux/205260307-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/seol-gold-collier-en-argent-massif-avec-cadenas-en-forme-de-cur/205311524-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/mango-collier-a-detail-chaine-dore/205665475-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/new-era-mlb-9forty-ny-casquette-unisexe-ajustable-bleu-marine-fonce/203603043-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/asos-design-bonnet-a-large-revers-noir/202368987-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/asos-design-echarpe-effilochee-camel/202434148-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/asos-design-echarpe-duveteuse-color-block-citron-vert-et-rose/203042289-2?$n_320w$&wid=317&fit=constrain'
]

images_sport_homme = [
  'https://images.asos-media.com/products/karl-kani-pantalon-de-jogging-en-jersey-coupe-classique-a-logo-signature-noir/205481549-2?$n_480w$&wid=476&fit=constrain',
  'https://images.asos-media.com/products/nike-club-jogger-a-chevilles-resserrees-gris/202336418-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/adidas-originals-essentials-jogger-gris/203390283-2?$n_320w$&wid=317&fit=constrain'
]
images_deguisement_homme = [
  'https://faites-lafete.com/23936-home_default/deguisements-saint-patrick-adulte-homme-.jpg',
  'https://faites-lafete.com/23838-home_default/deguisements-diplomes-etudiants-adulte-.jpg',
  'https://faites-lafete.com/23704-home_default/deguisements-base-ball-adulte-homme.jpg'
]
images_pantalon_homme = [
  'https://images.asos-media.com/products/bershka-pantalon-cargo-gris/205353185-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/bershka-pantalon-cargo-sable/205353178-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/bershka-pantalon-cargo-kaki/205353203-2?$n_320w$&wid=317&fit=constrain'
]
images_manteau_homme = [
  'https://images.asos-media.com/products/pullbear-doudoune-noir/205444653-1-black?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/asos-design-doudoune-noir/202344382-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/columbia-puffect-ii-doudoune-noir/202871685-2?$n_320w$&wid=317&fit=constrain'
]
images_autre_homme = [
  'https://images.asos-media.com/products/new-balance-550-baskets-blanc-et-gris/201076606-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/new-balance-327-baskets-orange-brule/203644331-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/valentino-bags-bosa-sac-bandouliere-marron-noir/204788900-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/the-north-face-jester-sac-banane-noir/204511216-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/asos-design-cravate-classique-noir-texture/205344632-2?$n_320w$&wid=317&fit=constrain'
]
images_deguisement_enfant = [
  'https://faites-lafete.com/23733-home_default/deguisements-majorettes-enfant-fille.jpg',
  'https://faites-lafete.com/23544-home_default/deguisements-pilotes-de-course-formule-1-enfant-garcon.jpg',
  'https://faites-lafete.com/23319-home_default/deguisements-policiers-enfant-garcon-.jpg'
]
images_autre_enfant = [
  'https://images.asos-media.com/products/new-era-mlb-9forty-ny-casquette-unisexe-ajustable-bleu-marine-fonce/203603043-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/new-balance-550-baskets-blanc-et-gris/201076606-2?$n_320w$&wid=317&fit=constrain',
  'https://images.asos-media.com/products/ginger-ray-calendrier-de-lavent-avec-petites-chaussettes/202794706-2?$n_320w$&wid=317&fit=constrain'
]
images_sport_enfant = [
  "https://media.intersport.fr/is/image/intersportfr/40427__R9G_Q1?$produit_l$&$product_grey$"
]

# Tableaux de genre (sexe) et de types
genres = ['Femme', 'Homme', 'Enfant']
sizes = ['XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL']
# Génération des produits
300.times do
  type = ['Laine', 'Coton', 'Soie', 'Lin', 'Synthétique', 'Plastique', 'Acier', 'Autre'].sample
  colors = ["rouge", "bleu", "jaune", "Vert", "Blanc", "Noir", "Gris", "Autre"].sample
  genre = genres.sample # Par défaut, tous les produits sont pour les femmes
  case genre
  when 'Femme'
    category = ['Sport', 'Déguisement', 'Pantalon', 'Jupe', 'Robe', 'Manteau', 'Autre'].sample
  when 'Homme'
    category = ['Sport', 'Déguisement', 'Pantalon', 'Costume', 'Manteau', 'Autre'].sample
  when 'Enfant'
    category = ['Déguisement', 'Sport', 'Autre'].sample
  end
  # images = [images_costume, images_deguisement, images_jupe, images_manteau, images_pantalon, images_robe, images_sport]
  if genre == 'Femme'
  # Sélectionnez les images en fonction de la catégorie
    case category
    when 'Sport'
      images = images_sport.sample
    when 'Déguisement'
      images = images_deguisement.sample
    when 'Pantalon'
      images = images_pantalon.sample
    when 'Jupe'
      images = images_jupe.sample
    when 'Robe'
      images = images_robe.sample
    when 'Manteau'
      images = images_manteau.sample
    when 'Autre'
      images = images_autre_femme.sample
    end
  elsif genre == 'Homme'
    case category
    when 'Sport'
      images = images_sport_homme.sample
    when 'Déguisement'
      images = images_deguisement_homme.sample
    when 'Pantalon'
      images = images_pantalon_homme.sample
    when 'Manteau'
      images = images_manteau_homme.sample
    when 'Costume'
      images = images_costume_homme.sample
    when 'Autre'
      images = images_autre_homme.sample
    end
  elsif genre == 'Enfant'
    case category
    when 'Déguisement'
    images = images_deguisement_enfant.sample
    when 'Sport'
      images = images_sport_enfant.sample
    when 'Autre'
      images = images_autre_enfant.sample
  end
end
  Product.create!(
    user_id: User.first.id,
    category: category,
    size: sizes.sample,
    price: random_price,
    title: category, # La catégorie devient le titre
    description: ["Parfait pour une soirée mondaine", "Pour sortir tous les jours", "S'habiller avec élégance"].sample,
    availability: [true, false].sample,
    sexe: genre,
    textile_type: type,
    couleurs: colors,
    image: images,
  )
end
