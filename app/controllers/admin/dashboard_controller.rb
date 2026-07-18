class Admin::DashboardController < Admin::BaseController
  def index
    @total_revenue = Transaction.where(category: 'income').sum(:amount)
    @active_queue_count = Booking.where(status: 'pending', booking_date: Date.today).count
    @total_services_count = Service.count
    @active_customers_count = Customer.where(status: 'Active').count
    @recent_bookings = Booking.includes(:customer, :service).order(created_at: :desc).limit(5)
    @today_appointments = Booking.includes(:customer, :service).where(booking_date: Date.today).order(:booking_time)
  end
end
