class User < ApplicationRecord
  has_many :rockets
  has_many :bookings
  has_one :renter
  has_one :owner
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  def owner?
    owner.present?
  end

  def renter?
    renter.present?
  end

end
