# frozen_string_literal: true

class Tour < ApplicationRecord
  belongs_to :user
    
  has_many_attached :avatars do |attachable|
    attachable.variant :large, resize_to_limit: [1080, 1920]    
  end

  validates :title , :detail  , :price ,
            :avatars , presence: true             

  before_save :update_slug

  def to_param
    slug || id
  end

  def update_slug
    self.slug = "#{title.downcase.to_s[0..100]}".parameterize
  end


end
