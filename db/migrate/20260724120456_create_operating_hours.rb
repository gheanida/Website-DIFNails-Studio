class CreateOperatingHours < ActiveRecord::Migration[8.1]
  def change
    create_table :operating_hours do |t|
      t.integer :day_of_week
      t.boolean :is_open
      t.time :open_time
      t.time :close_time

      t.timestamps
    end
  end
end
