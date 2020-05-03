class CreateSocialAccountings < ActiveRecord::Migration[6.0]
  def change
    create_table :social_accountings do |t|
      t.references :social_account
      t.string :social_accountable_type
      t.integer :social_accountable_id

      t.timestamps
    end
  end
end
