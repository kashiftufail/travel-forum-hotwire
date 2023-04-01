# frozen_string_literal: true

FactoryBot.define do
  factory :package do
    title { 'MyString' }
    tour { nil }
    price { 1.5 }
    detail { 'MyText' }
  end
end
