class Admin::TransactionsController < Admin::BaseController
  def index
    @transactions = Transaction.includes(booking: [:customer, :service]).order(transaction_date: :desc, id: :desc)
    @total_income = Transaction.where(category: 'income').sum(:amount)
    @total_expense = Transaction.where(category: 'expense').sum(:amount)
    @net_profit = @total_income - @total_expense
  end
end
