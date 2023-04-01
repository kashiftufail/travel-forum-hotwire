# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  validates :first_name, :last_name, presence: true
  validates :phone, numericality: true, presence: true, on: :update
  validates :address, presence: true, on: :update
end
