class Customer < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :name, presence: true, :uniqueness => {:scope => :user_id}
end
