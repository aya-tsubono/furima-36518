class BuyingHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @buying_history_address = BuyingHistoryAddress.new
  end


  def create
    @item = Item.find(params[:item_id])
    @buying_history_address = BuyingHistoryAddress.new(buying_history_params)
    if @buying_history_address.valid?
      pay_item
      @buying_history_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buying_history_params
    params.require(:buying_history_address).permit(:postcode, :area_id, :municipality, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: buying_history_params[:token], 
        currency: 'jpy'
      )
  end

end
