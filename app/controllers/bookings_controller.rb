class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    start_date = params.fetch(:start_time, Date.today).to_date
    @bookings = Booking.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @customer = Customer.new
    @customers = Customer.where(user: current_user)
  end

  def create
    if params[:booking][:customer].to_i == 0
      @customer = Customer.where(name: params[:booking][:customer]).where(user: current_user).last
    else
      @customer = Customer.find(params[:booking][:customer])
    end
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.customer = @customer
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

 def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :customer_id, :user_id, :price, :notes)
  end

end
