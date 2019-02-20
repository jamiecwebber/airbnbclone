class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking_id = params[:booking_id]
    if @review.save
      redirect_to(bookings_path)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
