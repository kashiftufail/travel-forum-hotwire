FactoryBot.define do
  factory :service_request do
    name { "MyString" }
    phone { "MyString" }
    no_of_night_stays { 1 }
    email { "MyString" }
    detail { "MyText" }
    user { nil }
  end
end
