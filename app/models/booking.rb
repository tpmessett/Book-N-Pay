class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  has_and_belongs_to_many :bookings
  validates :start_time, presence: true
  validates :end_time, presence: true
end
