class ApartmentsController < ApplicationController
  # GET /users/:user_id/appartments
  def index
    @apartment = Apartment.where({ user_id: params[:user_id] })
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

