# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Court.destroy_all
User.destroy_all
Match.destroy_all

puts 'Creating courts'
viateur = Court.create!(name: 'Tennis St-Viateur', address: '530 Avenue Querbes, Outremont, QC H2V 3W5')
lafontaine = Court.create!(name: 'Tennis Lafontaine', address: '3500 Avenue Emile-Duploye, Montreal, QC H2L 2T6')
indoor = Court.create!(name: 'Montreal Indoor Tennis Club', address: '4094 Cote-des-Neiges Rd, Montreal, QC H3H 1W8')

puts 'Creating users...'
asma = User.create!(first_name: "Asma", last_name: "Laaribi", email: "asma@email.com", password: "secret1", skill_level: "4", address: "5333 Avenue Casgrain, Montreal, QC H2T 1X3", admin: true)
gina = User.create!(first_name: "Gina", last_name: "Ko", email: "gina@email.com", password: "secret2", skill_level: "3", address: "994 Rue Rachel E, Montreal, QC H2J 2J3")
paul = User.create!(first_name: "Paul", last_name: "Szkwarek", email: "paul@email.com", password: "secret3", skill_level: "2", address: "3421 Park Ave, Montreal, QC H2X 2H6")
derek = User.create!(first_name: "Derek", last_name: "Nugroho", email: "derek@email.com", password: "secret4", skill_level: "1", address: "1297 Foret Rd, Outremont, QC H2V 2P9")

puts 'Skipping matches for now...'

puts 'All done!'
