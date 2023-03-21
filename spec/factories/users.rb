FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {"111111"}  
    password_confirmation(&:password)       
  end
end
