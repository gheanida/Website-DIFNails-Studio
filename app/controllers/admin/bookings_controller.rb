class Admin::BookingsController < Admin::BaseController
  before_action :set_booking, only: [:show, :update, :destroy]

  def index
    @bookings = Booking.includes(:service, :customer).order(booking_date: :desc, booking_time: :asc)

    if params[:status].present?
      @bookings = @bookings.where(status: params[:status])
    end

    if params[:q].present?
      @bookings = @bookings.joins(:customer).where("customers.name LIKE ? OR customers.phone LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    end
  end

  def show
  end

  def update
    if @booking.update(status: params[:status])
      redirect_back fallback_location: admin_bookings_path, notice: "Status booking berhasil diperbarui."
    else
      redirect_back fallback_location: admin_bookings_path, alert: "Gagal memperbarui status."
    end
  end

  def destroy
    @booking.destroy
    redirect_to admin_bookings_path, notice: "Booking berhasil dihapus."
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end