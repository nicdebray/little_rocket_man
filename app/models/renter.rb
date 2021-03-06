class Renter < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :country, presence: true
  validates :user_id, uniqueness: true
end
