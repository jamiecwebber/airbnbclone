class BookingsController < ApplicationController
  authorize @booking

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
    @apartment = Apartment.find(@booking.apartment.id)
  end

  def new
    @booking = Booking.new
    # link to bookings#new needs to send an :apartment_id parameter
    @apartment = Apartment.find(params[:apartment_id])
  end

  def create
    @apartment = Apartment.find(params[:booking][:apartment_id])
    @booking = Booking.new(booking_params)
    @total_days = (Date.parse(params[:booking][:exit_date]) - Date.parse(params[:booking][:enter_date])).to_i
    @booking.price_total = @total_days * @apartment.price_per_day
    @booking.user_id = current_user.id
    @booking.apartment = @apartment
    if @booking.save
      redirect_to booking_path(id: @booking.id)
    else
      render :new
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
    params.require(:booking).permit(:enter_date, :exit_date)
  end
end
