class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path, notice: '新しい配送先が登録されました。'
    else
      flash.now[:error] = @address.errors.full_messages.join(', ')
      @addresses = Address.all
      render :index
    end
  end


  def update
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
