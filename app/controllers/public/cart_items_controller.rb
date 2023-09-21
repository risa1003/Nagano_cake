class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total_amount = @cart_items.sum(&:subtotal)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path(@cart_item.id)
    else
      render:cart_item
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path(cart_item.id)
  end

  def destroy_all
    cart_item = current_customer.cart_items
    cart_item.destroy_all
    redirect_to cart_items_path
  end

  def create
    # カート内に同一の商品が存在するか確認
    existing_cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if existing_cart_item.present?
      # カート内に同一の商品が存在する場合、数量を増やす
      existing_cart_item.amount += params[:cart_item][:amount].to_i
      existing_cart_item.save
    else
      # カート内に同一の商品が存在しない場合、新しいカートアイテムを作成
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end