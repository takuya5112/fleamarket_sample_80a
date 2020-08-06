class ChangeSellerColumnsInItems < ActiveRecord::Migration[6.0]
  def change
    remove_index :items, column: :seller
    remove_index :items, column: :buyer

    remove_column :items, :seller, :bigint
    remove_column :items, :buyer, :bigint

    add_column :items, :seller_id, :bigint, null: false, foreign_key: true
    add_column :items, :buyer_id, :bigint, foreign_key: true

    add_index :items, :seller_id
    add_index :items, :buyer_id

  end
end

