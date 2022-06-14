class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :email
      t.text :password_digest
      t.string :image
      t.string :uid

      t.timestamps
    end
  end
end
