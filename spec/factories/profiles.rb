FactoryBot.define do
  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone {Faker::PhoneNumber.cell_phone_in_e164 }
    address {Faker::Address.full_address}
    
  end
end
