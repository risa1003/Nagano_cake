class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @Customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
    render :edit
  end

  def check
  end

  def withdraw
  end
end