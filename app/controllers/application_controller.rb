# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user, if: :user_signed_in?
  before_action :admin?, if: :user_signed_in?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:email, :password, :password_confirmation,
                  profile_attributes: %i[first_name last_name])
    end
  end

  private

  def set_current_user
    Current.user = current_user
  end

  def admin?
    Current.user.admin_role_type?
  end

  helper_method :admin?
end
