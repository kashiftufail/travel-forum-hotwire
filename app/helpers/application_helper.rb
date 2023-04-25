# frozen_string_literal: true

module ApplicationHelper
  def collapsible_welcome_path
    if user_signed_in?
      render partial: 'shared/sign_in_nav'
    else
      link_to 'Login', new_user_session_path, class: 'nav-item nav-link'
    end
  end

  def home_active    
    controller_name == "home" ? "nav-item nav-link active" : 
                                "nav-item nav-link" 
  end
  
  def services_active    
    controller_name == "services" ? "nav-item nav-link active" : 
                                    "nav-item nav-link" 
  end

  def tours_active    
    controller_name == "tours" ? "nav-item nav-link active" : 
                                    "nav-item nav-link" 
  end

  def avatar
    Current.user.profile.avatar.attached? ? 
      Current.user.profile.avatar :
      '/assets/default.png' 
  end  

  def assign_current_user(object)
    Current.user ? object.user = Current.user : object    
  end  

  def destination_avatar(destination)
    destination.avatars[0]
  end  
end
