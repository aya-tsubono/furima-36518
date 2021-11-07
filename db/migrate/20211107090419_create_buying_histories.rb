class CreateBuyingHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :buying_histories do |t|

      t.timestamps
    end
  end
end
