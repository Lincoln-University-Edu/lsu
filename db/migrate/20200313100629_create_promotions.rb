class CreatePromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :promotions do |t|
      t.string :title
      t.string :description
      t.string :email
      t.integer :phone_number
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.string :condition

      t.timestamps
    end
  end
end
