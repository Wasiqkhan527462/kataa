class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy]
  def index
    @customers = Customer.all

    if params[:customer_id].present?
      @customers = @customers.where(id: params[:customer_id])
    end
  
  end

  def show
    @customer = Customer.find(params[:id])
    @transactions = Transaction.where(customer: @customer.id)

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
  
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end
    def customer_params
      params.require(:customer).permit(:name, :phone_no, :cnic, :shop_keeper)
    end    
end
