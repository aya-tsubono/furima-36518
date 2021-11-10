require 'rails_helper'

RSpec.describe BuyingHistoryAddress, type: :model do
  describe '商品購入の保存' do
    before do
      user = FactoryBot.create(:user)
      @buying_history_address = FactoryBot.build(:buying_history_address, user_id: user.id)
    end

    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
      end
      it 'buildingは空でも保存できる' do
      end
    end

    context '購入ができない場合' do
      it 'postcodeが空では保存できない' do
      end
      it 'postcodeが半角のハイフンを含んでいないと保存できない' do
      end
      it 'areaが空では保存できない' do
      end
      it 'municipalityが空では保存できない' do
      end
      it 'addressesが空では保存できない' do
      end
      it 'phone_numberが空では保存できない' do
      end
      it 'userが紐付いていないと保存できない' do
      end
      it 'itemが紐付いていないと保存できない' do
      end
      it 'buying_historyが紐付いていないと保存できない' do
      end
    end
  end
end