class OrdersController < ApplicationController
  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

  def create
    apartment = Apartment.find(params[:apartment_id])
    order = Order.create!(apartment_sku: apartment.sku, amount: apartment.price, state: "pending", user: current_user )
    redirect_to new_order_payment_path(order)
  end
end
