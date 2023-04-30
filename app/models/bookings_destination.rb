class BookingsDestination < ApplicationRecord
  belongs_to :booking
  belongs_to :destination
end
