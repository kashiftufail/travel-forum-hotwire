# frozen_string_literal: true

class Tour < ApplicationRecord
  include Attachment
  has_many :destinations, dependent: :destroy
  has_many :packages, dependent: :destroy
  belongs_to :user
  has_many_attached :avatars 

  validates :price, :avatars, presence: true
  before_save :update_slug
end
