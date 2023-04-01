# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    title { Faker::Name.name }
    number { 120_020 }
    category
    price { 120 }
    quantity_in_hand { 10 }
    detail { Faker::Lorem.sentence(word_count: 10) }
    size { 'medium' }
    after(:build) do |file|
      file.avatar.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'about.jpg')),
                         filename: 'about.jpg', content_type: 'image/jpeg')
    end
  end
end
