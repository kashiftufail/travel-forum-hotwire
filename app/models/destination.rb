# frozen_string_literal: true

class Destination < ApplicationRecord
  include Attachment
  belongs_to :tour

  has_many_attached :avatars do |attachable|
    attachable.variant :large, resize_to_limit: [1080, 1420]    
  end

  validates :stay_days ,presence: true
  before_save :update_slug 
  
end
