namespace :utils do
  desc "Popular banco de dados."
  task seed: :environment do
  puts "Populando o banco de dados"
  
     100.times do |i|
      Contact.create!( 
        nome: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample)
       )
    end
puts "[Status OK]"

  puts "Gerando os endereços (address)..."
  
  Contact.all.each do |contact|
       Address.create!(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          contact: contact
        )
  
  puts "Status [OK]"
  end
    puts "Gerando os endereços (Phones)..."
  
  Contact.all.each do |contact|
    Random.rand(1..5).times do |i|
          Phone.create!(
             phone: Faker::PhoneNumber.phone_number,
             contact: contact
           )
       end
      end
    puts "Status [OK]"
  end

end
