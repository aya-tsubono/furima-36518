class BuyingHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @item = Item.find(params[:item_id])
    @buying_history_address = BuyingHistoryAddress.new
  end

  def new
    @buying_history_address = BuyingHistoryAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buying_history_address = BuyingHistoryAddress.new(buying_history_params)
    if @buying_history_address.valid?
      pay_item
      @buying_history_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def buying_history_params
    params.require(:buying_history_address).permit(:postcode, :prefectures, :municipality, :addresses, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_84b90dbf9f9b93bd1b86f5f5"
      Payjp::Charge.create(
        amount: @item.price, 
        card: buying_history_params[:token], 
        currency: 'jpy'
      )
  end

end
