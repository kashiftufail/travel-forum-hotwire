# frozen_string_literal: true

class DestinationsController < ApplicationController
  before_action :set_destination, only: %i[show]

  # GET /destinations or /destinations.json
  def index
    @destinations = Destination.all
  end

  # GET /destinations/1 or /destinations/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_destination
    @destination = Destination.find_by(slug: params[:id])
  end
end


