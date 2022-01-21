class Reservation < ApplicationRecord
  belongs_to :user
  # belongs_to :city
  belongs_to :car
end
