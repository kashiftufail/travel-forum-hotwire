FactoryBot.define do
  factory :profile do
    first_name { "Ali" }
    last_name { "Ahmed" }
    phone {"+923214145256"}
    address {"AA-449 DHA Lahore"}
    user_id {User.first}
  end
end
