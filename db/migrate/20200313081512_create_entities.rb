class CreateEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :description
      t.string :email
      t.integer :phone_number
      t.string :location
      t.boolean :is_office
      t.boolean :is_organisation

      t.timestamps
    end
  end
end
