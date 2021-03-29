class BookingsController < ApplicationController
  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @bookings = policy_scope(Booking).where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def show
    @booking = policy_scope(Booking).find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @customer = Customer.find(params[:customer_id])
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
    @booking = policy_scope(Booking).find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  def update
    @booking = policy_scope(Booking).find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def edit
    @booking = policy_scope(Booking).find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :customer_id, :user_id)
  end

end
