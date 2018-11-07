class Owner < ApplicationRecord
  belongs_to :user

  validates :company, presence: true
  validates :user_id, uniqueness: true
end
