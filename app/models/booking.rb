class Booking < ApplicationRecord
  belongs_to :rocket
  belongs_to :user
  belongs_to :owner :renter through: :user
end
