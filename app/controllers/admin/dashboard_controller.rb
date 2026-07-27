class Admin::DashboardController < Admin::BaseController
  def index
    today = Date.today

    @today_reservations_count = Booking.where(booking_date: today).where.not(status: "cancelled").count
    @active_queue_count = Booking.where(booking_date: today, status: "pending").count

    month_range = today.beginning_of_month..today.end_of_month
    @month_revenue = Transaction.where(transaction_date: month_range, transaction_type: "income").sum(:amount)

    @popular_service = Booking.joins(:service)
                               .group("services.name")
                               .order(Arel.sql("count_all DESC"))
                               .count
                               .first&.first || "Belum ada data"

    @weekly_data = (0..6).map do |i|
      date = today.beginning_of_week + i.days
      count = Booking.where(booking_date: date).where.not(status: "cancelled").count
      { date: date, label: date.strftime("%a"), count: count }
    end
    @max_weekly_count = [@weekly_data.map { |d| d[:count] }.max, 1].max

    @recent_reservations = Booking.includes(:service, :customer).order(created_at: :desc).limit(6)
  end
end