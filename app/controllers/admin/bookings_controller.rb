class Admin::BookingsController < Admin::BaseController
  before_action :set_booking, only: [:update, :destroy]

  def index
    @bookings = Booking.includes(:customer, :service).order(booking_date: :desc, booking_time: :asc)
    @today_bookings = Booking.includes(:customer, :service).where(booking_date: Date.today).order(:booking_time)
  end

  def update
    if @booking.update(booking_params)
      # If completed, let's auto-generate a transaction if it doesn't exist
      if @booking.status == 'completed' && !Transaction.exists?(booking_id: @booking.id)
        Transaction.create!(
          booking: @booking,
          amount: @booking.service.price,
          category: 'income',
          transaction_type: 'payment',
          transaction_date: Date.today,
          description: "Payment for #{@booking.service.name} - #{@booking.customer.name}"
        )
      end
      redirect_to admin_bookings_path, notice: "Booking status updated to #{@booking.status.capitalize}."
    else
      redirect_to admin_bookings_path, alert: "Failed to update booking status."
    end
  end

  def destroy
    @booking.destroy
    redirect_to admin_bookings_path, notice: "Booking was successfully deleted."
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :booking_date, :booking_time, :notes, :service_id, :customer_id)
  end
end
