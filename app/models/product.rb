# frozen_string_literal: true

class Product < ApplicationRecord
  include Attachment
  belongs_to :category
  has_one_attached :avatar do |attachable|
    attachable.variant :medium, resize_to_limit: [600, 400]
  end
  validates :number, :price, :size, :avatar,
            :quantity_in_hand, presence: true
  before_save :update_slug
  enum size: { 'Large': 'large', 'Medium': 'medium', 'Tiny': 'small' }
end
