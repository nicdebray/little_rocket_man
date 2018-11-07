class Rocket < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :capacity, presence: true, numericality: {greater_than: 0}
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :destination, presence: true

end
