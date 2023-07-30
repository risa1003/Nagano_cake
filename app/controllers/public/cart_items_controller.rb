class CartItemsController < ApplicationController
  def index
    @cart_items = Cart_items.all
  end

  def update
    @cart_item = Cart_item.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path(cart_item.id)
    else
      render:cart_item
    end
  end

  def destroy
    cart_item = Cart_item.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path(cart_item.id)
  end

  def destroy_all
  end

  def create
    @cart_item = Cart_items.new(cart_item_params)
    @cart_item.save
  end
end