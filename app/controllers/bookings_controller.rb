class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params.has_key?(:start_date)
      @date = params.fetch(:start_date).to_date
    else
      @date = Date.today
    end
    customer_bookings = Booking.where(user: current_user)
    @bookings = customer_bookings.where(start_time: @date.beginning_of_month.beginning_of_week..@date.end_of_month.end_of_week)

    if params.has_key?(:start) && params.has_key?(:view)
      @start = params[:start]
      @ending = params[:end]
      @bookings = customer_bookings.where('start_time >= ?', @start.to_date).where('start_time <= ?', @ending.to_date).all
    elsif params.has_key?(:view)
      @bookings = customer_bookings.where('start_time >= ?', Date.today).where('start_time <= ?', Date.today).all
    end
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
    @booking.price = params[:booking][:price].to_f*100
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
