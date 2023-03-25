# frozen_string_literal: true

FactoryBot.define do
  factory :destination do
    title { 'MyString' }
    detail { 'MyText' }
    tour { nil }
    stay_days { 1 }
  end
end
