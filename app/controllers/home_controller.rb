# frozen_string_literal: true

class HomeController < ApplicationController
  def index    
    @booking = Booking.new
    @user = User.new unless current_user
    @tours = Tour.includes([:avatars_attachments])    
  end
end
