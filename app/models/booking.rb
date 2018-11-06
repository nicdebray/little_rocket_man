class Booking < ApplicationRecord
  belongs_to :rocket
  belongs_to :user

  def self.rentings_for(user)
    joins(rocket: :user).where(users: { id: user })
  end
end
