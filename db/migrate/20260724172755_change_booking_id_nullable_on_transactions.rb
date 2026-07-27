class ChangeBookingIdNullableOnTransactions < ActiveRecord::Migration[7.1]
  def change
    change_column_null :transactions, :booking_id, true
  end
end