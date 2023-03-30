# frozen_string_literal: true

class Tour < ApplicationRecord
  include Attachment
  has_many :destinations , dependent: :destroy          
  belongs_to :user   

  has_many_attached :avatars do |attachable|
    attachable.variant :large, resize_to_limit: [1080, 1920]    
  end

  validates :price ,presence: true
  before_save :update_slug  


end
