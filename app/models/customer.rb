class Customer < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :name, presence: true
end
