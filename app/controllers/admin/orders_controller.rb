class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      #注文ステータスが「入金確認」の時、製作ステータスを全て「製作待ち」に更新
      @order_details.update_all(status: 1) if @order.status == "payment_confirmed"
    end
  end

  private
  def order_params
    params.require(:order).permit(:id, :status)
    params.require(:order_detail).permit(:id, :product_status)
  end
end
