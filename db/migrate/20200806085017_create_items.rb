class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.bigint :category_id, null: false, foreign_key: true
      t.references :brand, foreign_key: true
      t.integer :condition_id, null: false, foreign_key: true
      t.integer :postage_burden_id, null: false, foreign_key: true
      t.integer :prefecture_code, null: false
      t.integer :postage_days_id, null: false, foreign_key: true
      t.bigint :seller_id, null: false, foreign_key: true
      t.bigint :buyer_id, foreign_key: true
      t.datetime :deal_done_date

      t.timestamps
    end
    add_index :items, :category_id
    add_index :items, :seller_id
    add_index :items, :buyer_id
  end
end
