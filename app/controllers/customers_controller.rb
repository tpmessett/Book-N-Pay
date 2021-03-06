class CustomersController < ApplicationController
  before_action :authenticate_user!

  def index
    customers = Customer.where(user: current_user)
    @customers = customers.reverse
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.user = current_user
    if @customer.save && params[:formsrc] == "booking"
      @customer.id
    elsif @customer.save
      redirect_to customers_path
    else
      render :new
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :phone, :notes, :address, :name, :formsrc)
  end

end
