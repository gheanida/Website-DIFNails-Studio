class Admin::QueueController < Admin::BaseController
  def index
    @today_bookings = Booking.includes(:service, :customer)
                              .where(booking_date: Date.today)
                              .where.not(status: "cancelled")
                              .order(:booking_time)

    @total_today = @today_bookings.count
    @current_booking = @today_bookings.find { |b| b.status == "confirmed" }
    @waiting_bookings = @today_bookings.select { |b| b.status == "pending" }
    @completed_today = @today_bookings.select { |b| b.status == "completed" }.count
  end
end