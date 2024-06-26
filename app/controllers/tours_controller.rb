# frozen_string_literal: true

class ToursController < ApplicationController
  before_action :set_tour, only: %i[show]

  # GET /tours or /tours.json
  def index
    @tours = Tour.all
  end

  # GET /tours/1 or /tours/1.json
  def show
    @destinations = @tour.destinations.includes([:avatars_attachments])         
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tour
    @tour = Tour.find_by(slug: params[:id])
  end
end
