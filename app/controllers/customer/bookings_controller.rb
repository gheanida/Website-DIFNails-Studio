class Customer::BookingsController < Customer::BaseController
  before_action :set_booking, only: [:show]

  def index
    @bookings = current_customer.bookings.includes(:service).order(booking_date: :desc, booking_time: :asc)
  end

  def show
  end

  def new
    @booking = current_customer.bookings.new
    @services = Service.where(is_active: true)
  end

  def create
    @booking = current_customer.bookings.new(booking_params)
    @booking.status = 'pending' # Initial status

    if @booking.save
      redirect_to customer_bookings_path, notice: "Your appointment booking was successfully created. We will review it shortly!"
    else
      @services = Service.where(is_active: true)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = current_customer.bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:service_id, :booking_date, :booking_time, :notes)
  end
end
