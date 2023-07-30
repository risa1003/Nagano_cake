class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm #要確認
    @order = Order.new
    @order.save
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
end