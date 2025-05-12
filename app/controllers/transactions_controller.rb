class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:destroy, :edit, :update, :show]
  def index
    @customers = Customer.all
    @transactions = Transaction.includes(:customer).all
  
    if params[:customer_id].present?
      @transactions = @transactions.where(customer_id: params[:customer_id])
    end
  
    if params[:date].present?
      @transactions = @transactions.where(date: params[:date])
    end
  
    if params[:transaction_type].present?
      @transactions = @transactions.where(transaction_type: params[:transaction_type])
    end
  
    if params[:sort_by].present? && params[:order].present?
      @transactions = @transactions.order("#{params[:sort_by]} #{params[:order]}")
    else
      @transactions = @transactions.order(date: :desc) 
    end
  end

  def show
  end

  def new
    @transaction = Transaction.new
    @customers = Customer.all
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to transactions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to @transaction
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_path
  end

  private
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end
    def transaction_params
      params.require(:transaction).permit(:customer_id, :transaction_type, :date, :time, :featured_image, :amount)
    end
end
