class Car < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validates :duration, presence: true
  validates :seats, presence: true

  has_many :reservations
end
