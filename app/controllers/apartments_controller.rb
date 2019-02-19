class ApartmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
    @apartment = Apartment.find(params[:id])
    @apartment.destroy

    redirect_to apartments_path
  end

     private

  def apartment_params
    params.require(:apartment).permit(:user_id, :price_per_day, :category, :name, :description, :location)
  end
end

