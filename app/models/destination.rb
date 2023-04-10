# frozen_string_literal: true

class Destination < ApplicationRecord
  include Attachment
  belongs_to :tour
  has_many :destinations_packages
  has_many :packages, through: :destinations_packages


  has_many_attached :avatars do |attachable|
    attachable.variant :large, resize_to_limit: [1920, 1080]
  end

  validates :avatars, :stay_days, presence: true
  before_save :update_slug
end
