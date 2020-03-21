class AddConstraintsAndDefaultsToEntity < ActiveRecord::Migration[6.0]
  def change
    change_column_default :entities, :is_office, from: nil,to: false
    change_column_default :entities, :is_organisation, from: nil, to: false
    change_column_null :entities, :is_office, false
    change_column_null :entities, :is_organisation, false
  end
end
