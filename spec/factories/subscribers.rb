# frozen_string_literal: true

FactoryBot.define do
  factory :subscriber do
    email { 'MyString' }
    email_after_days { 1 }
  end
end
