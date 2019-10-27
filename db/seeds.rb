require 'faker'
Faker::Config.locale = 'fr'


Reservation.destroy_all
Listing.destroy_all
User.destroy_all
City.destroy_all


#Création des utilisateurs
50.times do
  User.create(email: Faker::Internet.email , phone_number: Faker::PhoneNumber.phone_number, name: Faker::Name.name, description: Faker::Lorem.paragraph)
end

#Création des villes
10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.postcode)
end

#Création des logements
10.times do
  Listing.create(available_beds: rand(1..6), price: rand(50..200), description: Faker::Lorem.paragraph_by_chars(number: 150, supplemental: false), has_wifi: [true,false].sample, welcome_message: Faker::Lorem.paragraph, admin_id: User.all.sample.id, city_id: City.all.sample.id)
end 

Listing.all.each do |my_listing|

#Pour chaque logement on crée ses reservations
  i = 2
   10.times do
   start_time = Time.now + (3600 * 24 *(i))
   end_time =  start_time + (3600 * 24)
   Reservation.create(start_date: start_time, end_date: end_time, guest_id: User.all.sample.id, listing_id: my_listing.id)
   i = i+1
   end
  
end





