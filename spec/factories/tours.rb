FactoryBot.define do
  factory :tour do
    title { Faker::Name.title }
    detail { Faker::Base.sentense  }
    price { 1.5 }
    after(:build) do |file|
      file.avatars.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'about.jpg')), 
                            filename: 'about.jpg', content_type: 'image/jpeg')
    end
    user
  end
end
