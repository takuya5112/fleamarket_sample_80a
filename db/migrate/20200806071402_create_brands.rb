class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|

      t.string :name, null: false
      t.index :name, unique: true

      t.timestamps
    end
  end
end
