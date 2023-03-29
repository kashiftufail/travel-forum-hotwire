class ProfilesController < ApplicationController
  
  before_action :set_profile, only: %i[edit update]

  def edit; end

  def update
    respond_to do |format|      
      if @profile.update(profile_params)        
        format.html { redirect_to edit_profile_url(@profile), notice: 'Profile was successfully updated.' }        
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end  
  end  

  private

  def set_profile
    @profile = Profile.find(params[:id])  
  end   
  def profile_params
    params.require(:profile).permit(:first_name,:last_name,:phone,:address,:avatar)
  end  
end
