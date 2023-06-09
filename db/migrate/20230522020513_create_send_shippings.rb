class CreateSendShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :send_shippings do |t|
      t.references  :purchase,           null: false, foreign_key: true
      t.string      :post_code,          null: false
      t.integer     :prefecture_id,      null: false
      t.string      :municipalities,     null: false
      t.string      :address,            null: false
      t.string      :building_name
      t.string      :telephone_number,   null: false
      
      t.timestamps
    end
  end
end
