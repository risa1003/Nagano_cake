class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
    #ジャンル追加予定
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item.id)
  end
end