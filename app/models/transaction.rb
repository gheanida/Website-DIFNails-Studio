class Transaction < ApplicationRecord
  belongs_to :booking, optional: true

  validates :transaction_type, inclusion: { in: %w[income expense] }
  validates :amount, numericality: { greater_than: 0 }
end