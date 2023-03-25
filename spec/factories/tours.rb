FactoryBot.define do
  factory :tour do
    title { "MyString" }
    detail { "MyText" }
    price { 1.5 }
    user { nil }
  end
end
