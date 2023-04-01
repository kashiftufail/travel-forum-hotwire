# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # binding.pry

    @user = User.new unless current_user
  end
end
