class Admin::CustomersController < Admin::BaseController
  def index
    @customers = Customer.order(name: :asc)
  end

  def show
    @customer = Customer.find(params[:id])
    @bookings = @customer.bookings.includes(:service).order(booking_date: :desc, booking_time: :asc)
  end
end
