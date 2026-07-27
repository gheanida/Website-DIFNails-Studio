class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :service

  after_update :create_income_transaction, if: -> { saved_change_to_status? && status == "completed" }

  private

  def create_income_transaction
    return if Transaction.exists?(booking_id: id)

    Transaction.create!(
      booking_id: id,
      transaction_type: "income",
      category: "Layanan",
      description: "Payment for #{service.name} - #{customer.name}",
      amount: service.price,
      transaction_date: Date.today
    )
  end
end