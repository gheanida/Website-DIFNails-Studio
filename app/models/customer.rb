class Customer < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
end