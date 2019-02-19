class ApartmentsController < ApplicationController
  # GET /apartments
  def index
    @apartments = Apartment.all

    # @apartments = Apartment.where({ user_id: params[:user_id] })
  end

  def show
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
    @apartment.update(apartment_params)
    if @apartment.save
      redirect_to apartment_path(@apartment)
    else
      render :edit
    end
  end

  def destroy
  end

     private

  def apartment_params
    params.require(:apartment).permit(:price_per_day, :category, :name, :description,:location)
  end
end

