class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = Order.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to order_detail_path
  end

  def update
    @order = Order.find(params[:order_id])
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order.order_details.all

    is_updated = true
    if @order_detail.update(order_detail_params)
      # 製作ステータスが「製作中」のときに、注文ステータスを「製作中」に更新する。
      @order.update(status: 2) if @order_detail.in_production == "in_progress"
      # ここから下の内容は③の内容になります。
      # 紐付いている注文商品の製作ステータスが "すべて" [製作完了]になった際に注文ステータスを「発送準備中」に更新する。
      @order_details.each do |order_detail|
        if order_detail.product_status != "completed" # 製作ステータスが「製作完了」ではない場合
          is_updated = false # is_updatedを「false」に変更する。
        end
      end
      # is_updatedがtrueの場合に、注文ステータスが「発送準備中」に更新。
      @order.update(status: 3) if is_updated
    end
    redirect_to admin_order_path(@order)
  end
end
