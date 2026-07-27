class Admin::TransactionsController < Admin::BaseController
  before_action :set_transaction, only: [:edit, :update, :destroy]

  def index
    today = Date.today
    @start_date = params[:start_date].present? ? Date.parse(params[:start_date]) : today.beginning_of_month
    @end_date = params[:end_date].present? ? Date.parse(params[:end_date]) : today.end_of_month

    range_transactions = Transaction.where(transaction_date: @start_date..@end_date)
    @total_income = range_transactions.where(transaction_type: "income").sum(:amount)
    @total_expense = range_transactions.where(transaction_type: "expense").sum(:amount)
    @net_profit = @total_income - @total_expense

    @total_bookings = Booking.where(booking_date: @start_date..@end_date).where.not(status: "cancelled").count
    @avg_ticket = @total_bookings > 0 ? (@total_income / @total_bookings) : 0

    @monthly_data = (0..5).map do |i|
      month_date = today.beginning_of_month - i.months
      month_income = Transaction.where(transaction_date: month_date.beginning_of_month..month_date.end_of_month, transaction_type: "income").sum(:amount)
      { label: month_date.strftime("%b"), amount: month_income }
    end.reverse
    @max_monthly = [@monthly_data.map { |m| m[:amount] }.max, 1].max

    @top_services = Booking.where(booking_date: @start_date..@end_date)
                            .where.not(status: "cancelled")
                            .joins(:service)
                            .group("services.name")
                            .count
                            .sort_by { |_, count| -count }
                            .first(3)
    total_top = @top_services.sum { |_, count| count }
    @top_services_with_pct = @top_services.map { |name, count| { name: name, pct: total_top > 0 ? (count.to_f / total_top * 100).round : 0 } }

    @recent_transactions = range_transactions.includes(booking: [:service, :customer]).order(transaction_date: :desc, created_at: :desc).limit(15)
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to admin_transactions_path, notice: "Transaksi berhasil ditambahkan."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to admin_transactions_path, notice: "Transaksi berhasil diperbarui."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
    redirect_to admin_transactions_path, notice: "Transaksi berhasil dihapus."
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:transaction_type, :category, :description, :amount, :transaction_date)
  end
end