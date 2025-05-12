class DashboardsController < ApplicationController
  def index
    @transactions = Transaction.count
    @customers = Customer.count
    @debit_amount = Transaction.where(transaction_type: "debit").sum(:amount)
    @credit_amount = Transaction.where(transaction_type: "credit").sum(:amount)
    @debit_amount_today = Transaction.where(transaction_type: "debit", date: Date.today).sum(:amount)
    @credit_amount_today = Transaction.where(transaction_type: "credit", date: Date.today).sum(:amount)
  end
end
