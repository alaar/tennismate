# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Availability.destroy_all
Match.destroy_all
Court.destroy_all
Availability.destroy_all
# because we used byebug to check, and availability is dependent to user,
# so we have to delete availability before deleting users
User.destroy_all

puts 'Creating courts'
viateur = Court.create!(name: 'Tennis St-Viateur', address: '530 Avenue Querbes, Outremont, QC H2V 3W5')
lafontaine = Court.create!(name: 'Tennis Lafontaine', address: '3500 Avenue Emile-Duploye, Montreal, QC H2L 2T6')
indoor = Court.create!(name: 'Montreal Indoor Tennis Club', address: '4094 Cote-des-Neiges Rd, Montreal, QC H3H 1W8')
lasalle = Court.create!(name: 'Arrondissement de LaSalle', address: 'Centre de tennis Cavelier 330, 80e Ave Lasalle, Quebec H8R 4A8')
monkland = Court.create!(name: 'Monkland Tennis Club', address: '4225 Ave Royal Montreal, Quebec H4A 3R9')
devon = Court.create!(name: 'Park Devon', address: '792 Ave Upper Belmont Westmount, Quebec H3Y 1J9')
jeanne = Court.create!(name: 'Parc Jeanne-Mance', address: "4422 de L'Esplanade Montreal, Quebec H2W 1B9")
mcgill = Court.create!(name: 'McGill Sports Complex', address: "475 Pine Ave W Montreal, Quebec H2W 1S4")
beubian = Court.create!(name: 'Parc Beaubien', address: "6633 6e Ave Montreal, Quebec H1Y 2X8")
mountroyal = Court.create!(name: 'Mount Royal Country Club', address: "1620 Boul Graham Mount Royal, Quebec H3R 1G8")
uniprix = Court.create!(name: 'Stade Uniprix', address: "285 rue Faillon Ouest Montreal, Quebec H2R 2W1")
arthur = Court.create!(name: 'Parc Arthur-Therrien', address: "3750 Boulevard Gaétan Laberge Montreal, Quebec")
robillard = Court.create!(name: 'Complèxe Claude Robillard', address: "1000 Ave Emile Journault Montreal, Quebec H2M 2E7")


users = []
users << User.new(age: 28, radius: 10, first_name: "Asma", last_name: "Laaribi", email: "asma@email.com", password: "secret", skill_level: 4, address: "5333 Avenue Casgrain, Montreal, QC H2T 1X3", photo: Rails.root.join("app/assets/images/Asma.jpg").open, admin: true, phone: "514-509-4564")
users << User.new(age: 25, radius: 16, first_name: "Gina", last_name: "Ko", email: "gina@email.com", password: "secret", skill_level: 3, address: "994 Rue Rachel E, Montreal, QC H2J 2J3", photo: Rails.root.join("app/assets/images/Gina.jpg").open, phone: "514-223-2354")
users << User.new(age: 30, radius: 4, first_name: "Paul", last_name: "Szkwarek", email: "paul@email.com", password: "secret", skill_level: 2, address: "3421 Park Ave, Montreal, QC H2X 2H6", photo: Rails.root.join("app/assets/images/Paul.jpg").open, phone: "604-724-6453")
# we use User.new instead of create function, cause we haven't had availability yet
# without availability, the user validation would fail. so we use User.new and create availability
# and then save all the information when the availability is created



users << User.new(age: 30, radius: 5, first_name: "Devin", last_name: "Fox", email: "devin@email.com", password: "secret", skill_level: 11, address: "535 Avenue Outremont, Outremont, QC H2V 3M4", photo: Rails.root.join("app/assets/images/devin.jpg").open, phone: "514-227-5577")
users << User.new(age: 32, radius: 10, first_name: "Marshall", last_name: "Bowman", email: "marshall@email.com", password: "secret", skill_level: 3, address: "1801 Avenue du Président-Kennedy, Montréal, QC H3A", photo: Rails.root.join("app/assets/images/marshall.jpg").open, phone: "514-271-7654")
users << User.new(age: 29, radius: 10, first_name: "Alfonso", last_name: "Byrd", email: "alfonso@email.com", password: "secret", skill_level: 6, address: "4821 Avenue Roslyn, Montréal, QC H3W 2H9", photo: Rails.root.join("app/assets/images/alfonso.jpg").open, phone: "514-276-3235")
users << User.new(age: 32, radius: 6, first_name: "Louis", last_name: "Tyler", email: "louis@email.com", password: "secret", skill_level: 5, address: "5235 Avenue Prince-Of-Wales, Montréal, QC H4V 2N2", photo: Rails.root.join("app/assets/images/louis.jpg").open, phone: "514-439-5432")
users << User.new(age: 24, radius: 5, first_name: "Ira", last_name: "Goodman", email: "ira@email.com", password: "secret", skill_level: 13, address: "4285 Rue de Bordeaux, Montréal, QC H2H 1Z4", photo: Rails.root.join("app/assets/images/ira.jpg").open, phone: "514-724-5678")
users << User.new(age: 26, radius: 12, first_name: "Wilson", last_name: "Mills", email: "wilson@email.com", password: "secret", skill_level: 6, address: "5156 Rue Parthenais, Montréal, QC H2H 2H3", photo: Rails.root.join("app/assets/images/wilson.jpg").open, phone: "514-227-2345")
users << User.new(age: 28, radius: 7, first_name: "Charlie", last_name: "Alvarado", email: "charlie@email.com", password: "secret", skill_level: 9, address: "920 Rue Napoléon, Montréal, QC H2L", photo: Rails.root.join("app/assets/images/charlie.jpg").open, phone: "514-271-8754")
users << User.new(age: 34, radius: 10, first_name: "Cesar", last_name: "Carlson", email: "cesar@email.com", password: "secret", skill_level: 8, address: "66 Saint Viateur street Ouest, Montreal, QC H2T 2K8", photo: Rails.root.join("app/assets/images/cesar.jpg").open, phone: "514-276-3765")
users << User.new(age: 36, radius: 11, first_name: "Dustin", last_name: "Fitzgerald", email: "dustin@email.com", password: "secret", skill_level: 4, address: "318 Rue Murray, Montréal, QC H3C 2E2", photo: Rails.root.join("app/assets/images/dustin.jpg").open, phone: "514-439-6243")
users << User.new(age: 24, radius: 5, first_name: "Shane", last_name: "Vasquez", email: "shane@email.com", password: "secret", skill_level: 4, address: "555 Rue Sainte Madeleine, Montréal, QC H3K 2L1", photo: Rails.root.join("app/assets/images/shane.jpg").open, phone: "514-724-4765")


users << User.new(age: 24, radius: 12, first_name: "Monica", last_name: "Caldwell", email: "monica@email.com", password: "secret", skill_level: 13, address: "7153 Rue Waverly, Montréal, QC H2S 3J1", photo: Rails.root.join("app/assets/images/monica.jpg").open, phone: "514-724-6768")
users << User.new(age: 26, radius: 12, first_name: "Dawn", last_name: "Chapman", email: "dawn@email.com", password: "secret", skill_level: 6, address: "10317 Avenue de l'Esplanade, Montréal, QC H3L 2Y1", photo: Rails.root.join("app/assets/images/dawn.jpg").open, phone: "514-227-7664")
users << User.new(age: 28, radius: 7, first_name: "Pauline", last_name: "Norris", email: "pauline@email.com", password: "secret", skill_level: 9, address: "1500 Basin Street Montreal, QC H3C 0N3", photo: Rails.root.join("app/assets/images/pauline.jpg").open, phone: "514-271-6754")
users << User.new(age: 22, radius: 10, first_name: "Kristi", last_name: "Gomez", email: "kristi@email.com", password: "secret", skill_level: 8, address: "66 Saint Viateur street Ouest, Montreal, QC H2T 2K8", photo: Rails.root.join("app/assets/images/kristi.jpg").open, phone: "514-276-3214")
users << User.new(age: 23, radius: 11, first_name: "Marsha", last_name: "Parks", email: "marsha@email.com", password: "secret", skill_level: 4, address: "4585 Sherbrooke Street Ouest, Outremont, QC H3Z 1E9", photo: Rails.root.join("app/assets/images/marsha.jpg").open, phone: "514-439-3456")
users << User.new(age: 24, radius: 5, first_name: "Pearl", last_name: "Clarke", email: "pearl@email.com", password: "secret", skill_level: 4, address: "6791 Avenue de Darlington, Montréal, QC H3S 2J7", photo: Rails.root.join("app/assets/images/pearl.jpg").open, phone: "514-724-6768")
users << User.new(age: 26, radius: 12, first_name: "Flora", last_name: "Malone", email: "flora@email.com", password: "secret", skill_level: 7, address: "6787 Rue de Normanville, Montréal, QC H2S 2C2", photo: Rails.root.join("app/assets/images/flora.jpg").open, phone: "514-227-1324")
users << User.new(age: 28, radius: 7, first_name: "Victoria", last_name: "Carson", email: "victoria@email.com", password: "secret", skill_level: 4, address: "1175 Avenue du Docteur-Penfield, Montréal, QC H3A 1B1", photo: Rails.root.join("app/assets/images/victoria.jpg").open, phone: "514-271-7890")
users << User.new(age: 34, radius: 10, first_name: "Amanda", last_name: "Webb", email: "amanda@email.com", password: "secret", skill_level: 7, address: "1705 Rue Parthenais, Montréal, QC H2K", photo: Rails.root.join("app/assets/images/amanda.jpg").open, phone: "514-276-6234")
users << User.new(age: 36, radius: 11, first_name: "Iris", last_name: "Lamb", email: "iris@email.com", password: "secret", skill_level: 6, address: "165 Chemin de la Côte-Sainte-Catherine, Outremont, QC H2V 2A7", photo: Rails.root.join("app/assets/images/iris.jpg").open, phone: "514-439-7456")





puts 'Skipping matches for now...'

puts 'updating availabilities'
Availability.all.each do |availability|
  availability.update!(available: rand > 0.5)
end

puts 'All done!'
