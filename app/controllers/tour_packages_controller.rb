# frozen_string_literal: true

class TourPackagesController < ApplicationController
  before_action :set_package, only: %i[show edit update destroy]

  # GET /packages or /packages.json
  def index    
    
    # binding.pry
    
    @tour_packages = Package.joins(:destinations).distinct

  end

  # GET /packages/1 or /packages/1.json
  def show; end

  # GET /packages/new
  def new
    @package = Package.new
  end

  # GET /packages/1/edit
  def edit; end

  # POST /packages or /packages.json
  def create
    @package = Package.new(package_params)

    respond_to do |format|
      if @package.save
        format.html { redirect_to package_url(@package), notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1 or /packages/1.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to package_url(@package), notice: 'Package was successfully updated.' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1 or /packages/1.json
  def destroy
    @package.destroy

    respond_to do |format|
      format.html { redirect_to packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_package
    @tour_package = Package.find_by(slug: params[:id])
    @destinations = @tour_package.destinations
  end

  # Only allow a list of trusted parameters through.
  def package_params
    params.require(:package).permit(:title, :tour_id, :price, :detail)
  end
end



# SELECT DISTINCT "packages".* FROM "packages" INNER JOIN "destinations_packages" ON "destinations_packages"."package_id" = "packages"."id" INNER JOIN "destinations" ON "destinations"."id" = "destinations_packages"."destination_id"
