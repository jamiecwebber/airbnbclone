class ApartmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  # User Apartments
  def mine
    @apartments = Apartment.where(user: current_user)
  end

  # GET /apartments
  def index

    if params[:query].present?
      @apartments = Apartment.global_search(params[:query])
    else
      @apartments = Apartment.all
    end
    # @apartments = Apartment.where({ user_id: params[:user_id] })

  end

  def show
    @booking = Booking.new
    @apartment = Apartment.find(params[:id])
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)
    if @apartment.save
      redirect_to apartment_path(@apartment)
    else
      render :new
    end
  end

  def edit
    @apartment = Apartment.find(params[:id])
  end

  def update
    @apartment = Apartment.find(params[:id])
    if @apartment.update(apartment_params)
      redirect_to apartment_path(@apartment)
    else
      render :edit
    end
  end

  def destroy
    @apartment = Apartment.find(params[:id])
    @apartment.destroy

    redirect_to apartments_path
  end

  private

  def apartment_params
    params.require(:apartment).permit(:user_id, :price_per_day, :category, :name, :description, :location, :upload_photos)
  end
end
