class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  validates :price, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
