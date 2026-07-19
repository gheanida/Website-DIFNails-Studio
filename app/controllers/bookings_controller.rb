class BookingsController < ApplicationController
  TIME_SLOTS = {
    "Pagi" => ["09:00", "10:00", "11:00"],
    "Siang" => ["13:00", "14:00", "15:00", "16:00"],
    "Sore" => ["18:00", "19:00"]
  }.freeze

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

  def index
    @today_bookings = Booking.includes(:service, :customer)
                              .where(booking_date: Date.today)
                              .where.not(status: "cancelled")
                              .order(:booking_time)

    @current_booking = @today_bookings.find { |b| b.status == "confirmed" }
    @waiting_bookings = @today_bookings.select { |b| b.status == "pending" }

    if params[:booking_id].present?
      @searched_booking = Booking.find_by(id: params[:booking_id].gsub(/\D/, ""))
    end
  end

  # STEP 1: Pilih Layanan
  def new
    @services = Service.where(is_active: true)
  end

  # STEP 2: Waktu & Detail
  def new_time
    @service = Service.find(params[:service_id])
    @selected_date = params[:date].present? ? Date.parse(params[:date]) : Date.today
    @selected_time = params[:time]
    @calendar_days = (Date.today..(Date.today + 13)).to_a
    @time_slots = TIME_SLOTS
    @booking = Booking.new

    booked = Booking.where(service_id: @service.id, booking_date: @selected_date)
                     .where.not(status: "cancelled")
                     .pluck(:booking_time)
    @booked_times = booked.map { |t| t.strftime("%H:%M") }
  end

  # STEP 3: Proses & Konfirmasi
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
      redirect_to booking_path(@booking), notice: "Reservasi berhasil dibuat!"
    else
      @service = Service.find(booking_params[:service_id])
      @selected_date = Date.parse(booking_params[:booking_date].to_s) rescue Date.today
      @selected_time = booking_params[:booking_time]
      @calendar_days = (Date.today..(Date.today + 13)).to_a
      @time_slots = TIME_SLOTS
      booked = Booking.where(service_id: @service.id, booking_date: @selected_date).where.not(status: "cancelled").pluck(:booking_time)
      @booked_times = booked.map { |t| t.strftime("%H:%M") }
      render :new_time, status: :unprocessable_entity
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

class BookingsController < ApplicationController
  TIME_SLOTS = {
    "Pagi" => ["09:00", "10:00", "11:00"],
    "Siang" => ["13:00", "14:00", "15:00", "16:00"],
    "Sore" => ["18:00", "19:00"]
  }.freeze

  before_action :set_booking, only: [:show]

  # Halaman Jadwal Antrian (publik, cari pakai ID booking)
  def index
    @today_bookings = Booking.includes(:service, :customer)
                              .where(booking_date: Date.today)
                              .where.not(status: "cancelled")
                              .order(:booking_time)

    @current_booking = @today_bookings.find { |b| b.status == "confirmed" }
    @waiting_bookings = @today_bookings.select { |b| b.status == "pending" }

    if params[:booking_id].present?
      @searched_booking = Booking.find_by(id: params[:booking_id].gsub(/\D/, ""))
    end
  end

  # Riwayat booking pribadi (cari pakai nomor HP)
  def history
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
    @services = Service.where(is_active: true)
  end

  def new_time
    @service = Service.find(params[:service_id])
    @selected_date = params[:date].present? ? Date.parse(params[:date]) : Date.today
    @selected_time = params[:time]
    @calendar_days = (Date.today..(Date.today + 13)).to_a
    @time_slots = TIME_SLOTS
    @booking = Booking.new

    booked = Booking.where(service_id: @service.id, booking_date: @selected_date)
                     .where.not(status: "cancelled")
                     .pluck(:booking_time)
    @booked_times = booked.map { |t| t.strftime("%H:%M") }
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
      redirect_to booking_path(@booking), notice: "Reservasi berhasil dibuat!"
    else
      @service = Service.find(booking_params[:service_id])
      @selected_date = Date.parse(booking_params[:booking_date].to_s) rescue Date.today
      @selected_time = booking_params[:booking_time]
      @calendar_days = (Date.today..(Date.today + 13)).to_a
      @time_slots = TIME_SLOTS
      booked = Booking.where(service_id: @service.id, booking_date: @selected_date).where.not(status: "cancelled").pluck(:booking_time)
      @booked_times = booked.map { |t| t.strftime("%H:%M") }
      render :new_time, status: :unprocessable_entity
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