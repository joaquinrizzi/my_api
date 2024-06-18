class Listing < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reservations, dependent: :destroy

  def available?(start_date, end_date)
    bookings.each do |booking|
      if booking.overlaps?(start_date, end_date)
        return false
      end
    end

    reservations.each do |reservation|
      if reservation.overlaps?(start_date, end_date)
        return false
      end
    end

    true
  end
end
