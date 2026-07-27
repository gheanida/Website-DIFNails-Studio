class AddDurationMinutesToServices < ActiveRecord::Migration[8.1]
  def change
    unless column_exists?(:services, :duration_minutes)
      add_column :services, :duration_minutes, :integer
    end
  end
end