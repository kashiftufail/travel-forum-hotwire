# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    address { Faker::Address.full_address }
    user
    after(:build) do |file|
      file.avatar.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'about.jpg')),
                         filename: 'about.jpg', content_type: 'image/jpeg')
    end
  end
end
