class User < ApplicationRecord
  has_many :rockets
  has_many :bookings
  has_many :renters
  has_many :owners
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable, :lockable
end
