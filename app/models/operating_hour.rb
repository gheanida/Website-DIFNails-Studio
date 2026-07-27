class OperatingHour < ApplicationRecord
  DAYS = %w[Senin Selasa Rabu Kamis Jumat Sabtu Minggu].freeze

  def day_name
    DAYS[day_of_week]
  end
end