class ApartmentsController < ApplicationController
  def index
  end

  def show
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
  end

  def update
  end

  def destroy
  end

     private

  def apartment_params
    params.require(:apartment).permit(:price_per_day, :category, :name, :description,:location)
  end
end

