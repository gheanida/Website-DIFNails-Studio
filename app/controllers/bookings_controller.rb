class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def index
    if params[:phone].present?
      @customer = Customer.find_by(phone: params[:phone])
      @bookings = @customer ? @customer.bookings.includes(:service).order(booking_date: :desc, booking_time: :asc) : []
    else
      @bookings = []
    end
  end

  def show
  end

  def new
    @booking = Booking.new
    @services = Service.where(is_active: true)
  end

  def create
    customer = Customer.find_or_create_by(phone: booking_params[:phone]) do |c|
      c.name = booking_params[:name]
    end

    @booking = customer.bookings.new(
      service_id: booking_params[:service_id],
      booking_date: booking_params[:booking_date],
      booking_time: booking_params[:booking_time],
      notes: booking_params[:notes],
      status: "pending"
    )

    if @booking.save
      redirect_to booking_path(@booking), notice: "Booking Anda berhasil dibuat. Simpan nomor HP Anda untuk cek status booking!"
    else
      @services = Service.where(is_active: true)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:name, :phone, :service_id, :booking_date, :booking_time, :notes)
  end
end