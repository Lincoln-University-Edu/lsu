class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :entity, null: false, foreign_key: true
      t.datetime :datetime
      t.string :name
      t.string :description
      t.string :location
      t.integer :price
      t.string :external_link
      t.string :category

      t.timestamps
    end
  end
end
