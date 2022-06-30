class CreateContractors < ActiveRecord::Migration[7.0]
  def change
    create_table :contractors do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :ubi
      t.integer :business_id
      t.timestamps
    end
  end
end
