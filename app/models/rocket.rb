class Rocket < ApplicationRecord
  belongs_to :user
  belongs_to :owner through: :user
end
