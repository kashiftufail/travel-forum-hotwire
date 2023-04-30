class BookingsController < ApplicationController
  include ApplicationHelper

  def index
  end

  def new 
    @booking = Booking.new
  end  

  def create
    @booking = Booking.new(booking_params)
    assign_current_user(@booking)
    respond_to do |format|
      if @booking.save
        @booking.book_destinations(params[:booking][:destinations])
        format.html { redirect_to root_url , notice: 'Your booking has been submited.' }        
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end  

  def search    
    @destinations = Destination.where("title LIKE ?", "%" +
                    Destination.sanitize_sql_like( params[:q]) + "%")
    render json: @destinations    
  end


  private

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:email, :phone, :no_of_persons, :departure_date,  
                                            :return_date, :stay_nights, :detail)
  end


end
