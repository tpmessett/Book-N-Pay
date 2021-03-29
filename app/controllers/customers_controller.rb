class CustomersController < ApplicationController
  def index
    @customers = policy_scope(Customer).all
  end

  def show
    @customer = policy_scope(Customer).find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.user = current_user
    if @customer.save
      redirect_to customer_path(@customer)
    else
      render :new
    end
  end

  def destroy
    @customer = policy_scope(Customer).find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end

  def update
    @customer = policy_scope(Customer).find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer)
  end

  def edit
    @customer = policy_scope(Customer).find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :phone, :notes, :address, :name)
  end

end
