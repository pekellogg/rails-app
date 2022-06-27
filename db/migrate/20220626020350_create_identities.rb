class CreateIdentities < ActiveRecord::Migration[7.0]
  def change
    create_table :identities do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :image
      t.string :name
      t.integer :user_id, default: nil
      t.timestamps
    end
  end
end