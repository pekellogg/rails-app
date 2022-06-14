class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :ubi
      t.string :name
      t.string :phone
      t.string :address
      t.string :city
      t.string :zip
      t.string :state
      t.integer :state_id
      t.string :code
      t.string :code_desc

      t.timestamps
    end
  end
end
