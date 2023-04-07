# frozen_string_literal: true

module ApplicationHelper
  def collapsible_welcome_path
    if user_signed_in?
      render partial: 'shared/sign_in_nav'
    else
      link_to 'Login', new_user_session_path, class: 'nav-item nav-link'
    end
  end

  def avatar
    Current.user.profile.avatar.attached? ? 
      Current.user.profile.avatar :
      '/assets/default.png' 
  end  
end
