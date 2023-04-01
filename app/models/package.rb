# frozen_string_literal: true

class Package < ApplicationRecord
  include Attachment
  belongs_to :tour
  validates :price, :no_of_persons, presence: true
  before_save :update_slug
end
