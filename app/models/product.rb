class Product < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :bookings
  validates :name, presence: true, :price, presence: true, :uniqueness => {:scope => :user_id}
end
