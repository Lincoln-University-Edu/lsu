class CreateLikings < ActiveRecord::Migration[6.0]
  def change
    create_table :likings do |t|
      t.integer :likeable_id
      t.string :likeable_type
      t.references :like

      t.timestamps
    end
  end
end
