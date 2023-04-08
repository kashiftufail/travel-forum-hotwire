class ServicesController < ApplicationController
  include ApplicationHelper

  def index
  end

  def new
    @service_request = ServiceRequest.new  
    @query = params[:query]   
  end
  
  def create
    @service_request = ServiceRequest.new(service_request_params)
    assign_current_user(@service_request)
    respond_to do |format|
      if @service_request.save
        format.html { redirect_to root_url , notice: 'Your request has been submited.' }        
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end  

  private

  # Only allow a list of trusted parameters through.
  def service_request_params
    params.require(:service_request).permit(:service_type, :name, :email, :phone, 
                                                :no_of_night_stays, :detail)
  end


end
