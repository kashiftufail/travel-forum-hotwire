# frozen_string_literal: true

class Destination < ApplicationRecord
  include Attachment
  belongs_to :tour
  has_many :destinations_packages
  has_many :packages, through: :destinations_packages
  has_many_attached :avatars 
  
  validates :avatars, :stay_days, presence: true
  before_save :update_slug
end
