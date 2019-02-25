class ApartmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  # User Apartments
  def mine
    @apartment = Apartment.new
    @apartments = Apartment.where(user: current_user)
  end

  # Search Results Page
  def map_search
    @apartments = Apartment.where.not(latitude: nil, longitude: nil)

    @markers = @apartments.map do |apartment|
      { lng: apartment.longitude,
        lat: apartment.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { apartment: apartment })
      }
    end
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
    @review = Review.new
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
      redirect_to :mine
    else
      render :mine
    end
  end

  def destroy
    @apartment = Apartment.find(params[:id])
    @apartment.destroy

    redirect_to apartments_path
  end

  private

  def apartment_params
    params.require(:apartment).permit(:user_id, :price_per_day, :category, :name, :description, :address, :upload_photos)
  end
end
