# frozen_string_literal: true

module Attachment
  extend ActiveSupport::Concern

  included do
    validates :title, :detail, presence: true
  end

  def to_param
    slug || id
  end

  def update_slug
    self.slug = title.downcase.to_s[0..100].to_s.parameterize
  end
end
