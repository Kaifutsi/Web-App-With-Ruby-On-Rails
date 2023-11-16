class Booking < ApplicationRecord
  belongs_to :manicure
  validates :name, :email, :booking_date, presence: true
end
