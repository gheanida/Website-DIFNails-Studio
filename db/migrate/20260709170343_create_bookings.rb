class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.date :booking_date
      t.time :booking_time
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
