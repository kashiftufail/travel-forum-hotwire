FactoryBot.define do
  factory :order do
    sub_total { 1.5 }
    total { 1.5 }
    shipping_address { "MyString" }
    payment_mod { 1 }
    name { "MyString" }
    email { "MyString" }
    phone { "MyString" }
  end
end
