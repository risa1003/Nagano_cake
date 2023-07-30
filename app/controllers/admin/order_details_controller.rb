class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = Order.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to order_detail_path
  end
end
