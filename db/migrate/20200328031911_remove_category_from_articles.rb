class RemoveCategoryFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :category
  end
end
