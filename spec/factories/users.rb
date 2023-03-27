# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '111111' }
    password_confirmation(&:password)
    profile_attributes { attributes_for(:profile) }
  end
end
