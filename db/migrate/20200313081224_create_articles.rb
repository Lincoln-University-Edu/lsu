class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :author_name
      t.string :title
      t.string :description
      t.string :body
      t.string :cover_image
      t.string :category

      t.timestamps
    end
  end
end
