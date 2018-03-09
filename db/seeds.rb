# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Match.destroy_all
Court.destroy_all
User.destroy_all

puts 'Creating courts'
viateur = Court.create!(name: 'Tennis St-Viateur', address: '530 Avenue Querbes, Outremont, QC H2V 3W5')
lafontaine = Court.create!(name: 'Tennis Lafontaine', address: '3500 Avenue Emile-Duploye, Montreal, QC H2L 2T6')
indoor = Court.create!(name: 'Montreal Indoor Tennis Club', address: '4094 Cote-des-Neiges Rd, Montreal, QC H3H 1W8')

puts 'Creating users...'

asma = User.create!(age: 28, radius:10, first_name: "Asma", last_name: "Laaribi", email: "asma@email.com", password: "secret", skill_level: 4, address: "5333 Avenue Casgrain, Montreal, QC H2T 1X3", photo: Rails.root.join("app/assets/images/Asma.png").open, admin: true)
gina = User.create!(age: 25, radius: 25, first_name: "Gina", last_name: "Ko", email: "gina@email.com", password: "secret", skill_level: 3, address: "994 Rue Rachel E, Montreal, QC H2J 2J3", photo: Rails.root.join("app/assets/images/Gina.png").open)
paul = User.create!(age: 30, radius: 1, first_name: "Paul", last_name: "Szkwarek", email: "paul@email.com", password: "secret", skill_level: 2, address: "3421 Park Ave, Montreal, QC H2X 2H6", photo: Rails.root.join("app/assets/images/Paul.png").open)
derek = User.create!(age: 23, radius: 5, first_name: "Derek", last_name: "Nugroho", email: "derek@email.com", password: "secret", skill_level: 1, address: "1297 Foret Rd, Outremont, QC H2V 2P9", photo: Rails.root.join("app/assets/images/Derek.png").open)
pete = User.create!(age: 47, radius:20, first_name: "Pete", last_name: "Sampra", email: "pete@email.com", password: "secret", skill_level: 14, address: "125 Ontario Street East, Montreal, QC H2X 1G9", photo: Rails.root.join("app/assets/images/pete.jpg").open)
novak = User.create!(age: 32, radius: 10, first_name: "Novak", last_name: "Djokovic", email: "novak@email.com", password: "secret", skill_level: 13, address: "1500 Basin Street Montreal, QC H3C 0N3", photo: Rails.root.join("app/assets/images/novak.jpg").open)
serena = User.create!(age: 29, radius: 10, first_name: "Serena", last_name: "Williams", email: "serena@email.com", password: "secret", skill_level: 12, address: "66 Saint Viateur street Ouest, Montreal, QC H2T 2K8", photo: Rails.root.join("app/assets/images/serena.png").open)
roger = User.create!(age: 32, radius: 5, first_name: "Roger", last_name: "Federer", email: "roger@email.com", password: "secret", skill_level: 14, address: "4585 Sherbrooke Street Ouest, Outremont, QC H3Z 1E9", photo: Rails.root.join("app/assets/images/roger.jpg").open)


puts 'Skipping matches for now...'

puts 'All done!'
