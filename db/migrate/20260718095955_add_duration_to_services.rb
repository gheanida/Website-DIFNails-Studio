class AddDurationToServices < ActiveRecord::Migration[8.1]
  def change
    add_column :services, :duration_minutes, :integer
  end
end
