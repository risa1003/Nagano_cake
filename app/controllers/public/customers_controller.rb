class Public::CustomersController < ApplicationController
  def show #リンク名はmypage
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @Customer.update(customer_params)
      redirect_to mypage_path(@customer.id)
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