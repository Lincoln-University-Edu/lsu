class RemovePolymorphicAttributesFromImages < ActiveRecord::Migration[6.0]
  def change
    remove_column :images, :imageable_type
    remove_column :images, :imageable_id
  end
end
