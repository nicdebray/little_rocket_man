class Owner < ApplicationRecord
  belongs_to :user
  has_many :bookings through: :user
end
