class BuyingHistoriesController < ApplicationController

  def index
  end

  def new
    @buying_history_address = BuyingHistoryAddress.new
  end

  def create
    @buying_history_address = BuyingHistoryAddress.new(buying_history_params)
    if @buying_history_address.valid?
      @buying_history_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def buying_history_params
    params.require(:buying_history_address).permit(:postcode, :prefectures, :municipality, :addresses, :building, :phone_number).merge(user_id: current_user.id)
  end

end
