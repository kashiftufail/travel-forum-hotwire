FactoryBot.define do
  factory :tour do
    title { Faker::Lorem.sentence }
    detail { Faker::Lorem.sentence(word_count: 10) }
    price { 1.5 }
    after(:build) do |file|
      3.times do
        file.avatars.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'about.jpg')), 
                            filename: 'about.jpg', content_type: 'image/jpeg')
      end                      
    end
    user
  end
end
