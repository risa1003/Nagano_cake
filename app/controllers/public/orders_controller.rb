class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm #要確認
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.payment_type = params[:order][:payment_type]
    @order.postage = 800
    @cart_items = current_customer.cart_items.all
    @total_amount = @cart_items.sum(&:subtotal)
    @order.total_payment = @total_amount
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
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      current_customer.cart_items.each do |cart_item|
        @order_details = OrderDetail.new
        @order_details.item_id = cart_item.item_id
        @order_details.amount = cart_item.amount
        @order_details.price_tax_in = cart_item.item.price*1.10
        @order_details.order_id = @order.id
        @order_details.save
      end
      current_customer.cart_items.destroy_all
      redirect_to thanks_path
    else
      render "new"
    end
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = current_customer.orders.find(params[:id])
    @cart_items = current_customer.cart_items.all
    @total_amount = @cart_items.sum(&:subtotal)
  end

  private

  def order_params
    params.require(:order).permit(:payment_type, :address, :postal_code, :receiver_name, :postage, :total_payment, :status, :customer_id)
  end
end