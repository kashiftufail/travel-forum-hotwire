# frozen_string_literal: true

class Product < ApplicationRecord
  include Attachment
  has_many :line_items, dependent: :destroy
  belongs_to :category
  has_many_attached :avatars do |attachable|
    attachable.variant :medium, resize_to_limit: [600, 400]
  end
  validates :price, :avatars,
            :quantity_in_hand, presence: true
  before_save :update_slug
  enum size: { 'Large': 'large', 'Medium': 'medium', 'Tiny': 'small' }
end
