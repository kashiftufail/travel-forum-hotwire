# frozen_string_literal: true

class Package < ApplicationRecord
  include Attachment  
  has_many :destinations_packages
  has_many :destinations, through: :destinations_packages

  validates :price, :no_of_persons, presence: true
  before_save :update_slug
end
