class CreateKeywordings < ActiveRecord::Migration[6.0]
  def change
    create_table :keywordings do |t|
      t.references :keyword, null: false, foreign_key: true
      t.string :keywordable_type
      t.integer :keywordable_id

      t.timestamps
    end
  end
end
