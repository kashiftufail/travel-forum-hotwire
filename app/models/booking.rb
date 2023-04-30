class Booking < ApplicationRecord
  has_many :bookings_destinations
  has_many :destinations, through: :bookings_destinations  
  belongs_to :user, optional: true

  def book_destinations(destinations_ids)
    destinations_ids.reject(&:empty?).map do |id| 
      BookingsDestination.create(booking_id: self.id, destination_id: id)
    end  
  end  
end
