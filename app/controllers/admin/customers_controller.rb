class Admin::CustomersController < Admin::BaseController
  def index
    @customers = Customer.includes(bookings: :service).order(created_at: :desc)

    if params[:q].present?
      @customers = @customers.where("name LIKE ? OR phone LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    end
  end

  def show
    @customer = Customer.find(params[:id])
    @bookings = @customer.bookings.includes(:service).order(booking_date: :desc, booking_time: :desc)
    @total_spent = @bookings.where(status: "completed").sum { |b| b.service.price }
  end
end