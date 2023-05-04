# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # binding.pry
    @booking = Booking.new
    @user = User.new unless current_user
    @tours = Tour.all
  end
end
