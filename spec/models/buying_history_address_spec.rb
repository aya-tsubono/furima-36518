require 'rails_helper'

RSpec.describe BuyingHistoryAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buying_history_address = FactoryBot.build(:buying_history_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入の保存' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@buying_history_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @buying_history_address.building = ''
        expect(@buying_history_address).to be_valid
      end
    end

    context '購入ができない場合' do
      it 'postcodeが空では保存できない' do
        @buying_history_address.postcode = ''
        @buying_history_address.valid?
        expect(@buying_history_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んでいないと保存できない' do
        @buying_history_address.postcode = '1234567'
        @buying_history_address.valid?
        expect(@buying_history_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'areaが空では保存できない' do
        @buying_history_address.area_id = 1
        @buying_history_address.valid?
        expect(@buying_history_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalityが空では保存できない' do
        @buying_history_address.municipality = ''
        @buying_history_address.valid?
        expect(@buying_history_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressesが空では保存できない' do
        @buying_history_address.addresses = ''
        @buying_history_address.valid?
        expect(@buying_history_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @buying_history_address.phone_number = ''
        @buying_history_address.valid?
        expect(@buying_history_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは、10桁以上11桁以内の半角数値でないと保存できない' do
        @buying_history_address.phone_number = '0908877'
        @buying_history_address.valid?
        expect(@buying_history_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは、9桁以下の半角数値では保存できない' do
        @buying_history_address.phone_number = '090887766'
        @buying_history_address.valid?
        expect(@buying_history_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは、12桁以上の半角数値では保存できない' do
        @buying_history_address.phone_number = '090887766554433'
        @buying_history_address.valid?
        expect(@buying_history_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは、ハイフンが含まれていると保存できない' do
        @buying_history_address.phone_number = '090-8888-9999'
        @buying_history_address.valid?
        expect(@buying_history_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では保存できない' do
        @buying_history_address.token = nil
        @buying_history_address.valid?
        expect(@buying_history_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @buying_history_address.user_id = ''
        @buying_history_address.valid?
        expect(@buying_history_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @buying_history_address.item_id = ''
        @buying_history_address.valid?
        expect(@buying_history_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
