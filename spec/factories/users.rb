FactoryBot.define do
  factory :user do
    email {"foo@foo.com"}
    password {"111111"}  
    password_confirmation {"111111"}      
  end
end
