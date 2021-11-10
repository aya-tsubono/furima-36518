class BuyingHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif (current_user.id != @item.user_id) && @item.buying_history.present?
      redirect_to root_path
    end
    @buying_history_address = BuyingHistoryAddress.new
  end

  def create
    @buying_history_address = BuyingHistoryAddress.new(buying_history_params)
    if @buying_history_address.valid?
      pay_item
      @buying_history_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

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
