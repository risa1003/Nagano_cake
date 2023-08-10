class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.save
  end

  def update
    @customer = current_customer
    if @Customer.update(customer_params)
      redirect_to mypage_path(@customer.id)
    else
      render :edit
    end
  end

  def destroy
    #find.params[:id]ではできないかも
    address = Address.find(params[:id])
    address.destroy
    redirect_to '/mypage'
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :receiver_name)
  end
end
