class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
    # link to bookings#new needs to send an :apartment_id parameter
    @apartment = params[:apartment_id]
  end

  def create
    @user = User.find(params[:user_id])
    @apartment = Apartment.find(params([:apartment_id]))
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.apartment = @apartment
    if @booking.save
      redirect_to user_booking_path(@booking)
    else
      :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:enter_date, :exit_date, :price_total)
  end
end
