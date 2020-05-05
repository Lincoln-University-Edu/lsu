class RenameTypeToAccountTypeOnSocialAccount < ActiveRecord::Migration[6.0]
  def change
    rename_column :social_accounts, :type, :account_type
  end
end
