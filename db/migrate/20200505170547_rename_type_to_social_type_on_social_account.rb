class RenameTypeToSocialTypeOnSocialAccount < ActiveRecord::Migration[6.0]
  def change
    rename_column :social_accounts, :account_type, :social_type
  end
end
