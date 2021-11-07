class CreateBuyingHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :buying_histories do |t|
      t.references :price, null: false, foreign_key: true
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
