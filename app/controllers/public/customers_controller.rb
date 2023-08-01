class Public::CustomersController < ApplicationController
  def show #リンク名はmypage
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
  end

  def check
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
end