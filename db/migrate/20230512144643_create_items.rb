class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,                null: false, foreign_key: true
      t.integer    :category_id,         null: false
      t.string     :item_name,           null: false
      t.text       :item_explanation,    null: false
      t.integer    :situation_id,        null: false
      t.integer    :item_price,          null: false
      t.integer    :shipping_charge_id,  null: false
      t.integer    :delivery_id,         null: false
      t.integer    :prefecture_id,       null: false

      t.timestamps
    end
  end
end
