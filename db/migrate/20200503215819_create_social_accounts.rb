class CreateSocialAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :social_accounts do |t|
      t.string :type
      t.string :detail

      t.timestamps
    end
  end
end
