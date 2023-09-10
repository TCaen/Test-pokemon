# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Créez une méthode pour générer un mot de passe crypté pour chaque utilisateur
require 'faker'
require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation, except: %w[spatial_ref_sys])


# Générez 10 utilisateurs avec les paramètres requis
10.times do |i|
  password = Faker::Internet.password(min_length: 8) # Générez un mot de passe aléatoire
  User.create!(
    email: "user#{i + 1}@example.com",
    password: password,
    password_confirmation: password,
    balance: 0,
    money: i * 100,
    name: "User #{i + 1}"
  )
end

# Obtenez la liste des IDs des utilisateurs de 1 à 10
user_ids = (1..10).to_a

# Compteur pour attribuer les ID d'utilisateur de manière cyclique
user_counter = 0

# Générez 30 Pokémon et attribuez-les de manière cyclique aux utilisateurs
30.times do
  user_id = user_ids[user_counter % 10] # Sélectionnez un ID d'utilisateur de 1 à 10 de manière cyclique
  Pokemon.create!(
    name: Faker::Games::Pokemon.name,
    imagepath: Faker::Avatar.image,
    weight: rand(1.0..100.0),
    height: rand(0.1..3.0),
    price: rand(1..1000),
    user_id: user_id
  )
  
  user_counter += 1
end