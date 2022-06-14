class CreateContractors < ActiveRecord::Migration[7.0]
  def change
    create_table :contractors do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :business_ubi

      t.timestamps
    end
  end
end
