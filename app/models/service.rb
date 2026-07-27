class Service < ApplicationRecord
  belongs_to :service_category
  has_one_attached :photo
  has_many :bookings

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end