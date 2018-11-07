class Booking < ApplicationRecord
  belongs_to :rocket
  belongs_to :user

  validates :departure_date, presence: true, departure_date_cannot_be_in_the_past

  def departure_date_cannot_be_in_the_past
    errors.add(:departure_date, "can't be in the past") if
    !departure_date.blank? and departure_date < Date.today
  end


  def self.rentings_for(user)
    joins(rocket: :user).where(users: { id: user })
  end
end
