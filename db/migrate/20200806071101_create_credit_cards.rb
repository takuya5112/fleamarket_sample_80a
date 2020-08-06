class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|

      t.references :user, null: false, foreign_key: true
      t.integer :card_number, null: false
      t.integer :expiration_year, null: false
      t.integer :expiration_month, null: false
      t.integer :security_code, null: false

      t.timestamps
    end
    add_index :credit_cards, :card_number, unique: true

  end
end
