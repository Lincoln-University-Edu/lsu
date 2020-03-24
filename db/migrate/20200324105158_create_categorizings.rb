class CreateCategorizings < ActiveRecord::Migration[6.0]
  def change
    create_table :categorizings do |t|
      t.string :categorizable_type
      t.integer :categorizable_id
      t.references :category
      t.timestamps
    end
  end
end
