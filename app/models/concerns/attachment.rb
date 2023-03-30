module Attachment
  extend ActiveSupport::Concern 

  included do
    validates :title,:detail,:avatars , presence: true    
  end 
  

  def to_param
    slug || id
  end

  def update_slug
    self.slug = "#{title.downcase.to_s[0..100]}".parameterize
  end

end