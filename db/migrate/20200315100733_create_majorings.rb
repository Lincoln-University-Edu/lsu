class CreateMajorings < ActiveRecord::Migration[6.0]
  def change
    create_table :majorings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :major, null: false, foreign_key: true

      t.timestamps
    end
  end
end
