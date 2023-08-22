class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm #要確認
    @order = Order.new(order_params)
    if params[:order][:select_address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.receiver_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "2"
      ship = Address.find(params[:order][:address_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.receiver_name = ship.receiver_name
    #elsif params[:order][:select_address] == "3"
    #   @order.postal_code = params[:order][:postal_code]
    #   @order.address = params[:order][:address]
    #   @order.receiver_name = params[:order][:receiver_name]
    # else
    #   render 'new'
    end
    @cart_items = current_customer.cart_items.all
    @total_amount = @cart_items.sum(&:subtotal)
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    #もしかしたらここでnewではないかも？confirmでsaveしてるから
    @order.customer_id = current_customer.id
    @order.save
    redirect_to thanks_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_type, :address, :postal_code, :receiver_name)
  end
end