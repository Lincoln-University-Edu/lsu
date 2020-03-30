class CreateImagings < ActiveRecord::Migration[6.0]
  def change
    create_table :imagings do |t|
      t.references :image
      t.integer :imageable_id
      t.string :imageable_type

      t.timestamps
    end
  end
end
