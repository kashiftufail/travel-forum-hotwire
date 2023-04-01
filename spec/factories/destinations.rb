# frozen_string_literal: true

FactoryBot.define do
  factory :destination do
    title { Faker::Lorem.sentence }
    detail { Faker::Lorem.sentence(word_count: 10) }
    stay_days { 15 }
    after(:build) do |file|
      3.times do
        file.avatars.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'about.jpg')),
                            filename: 'about.jpg', content_type: 'image/jpeg')
      end
    end
    tour
  end
end
