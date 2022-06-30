class CreateLicenses < ActiveRecord::Migration[7.0]
  def change
    create_table :licenses do |t|
      t.string :number
      t.string :type_code
      t.string :code_desc
      t.string :specialty_code
      t.string :specialty_code_desc
      t.string :status_code
      t.string :ubi
      t.date :effective
      t.date :expires
      t.string :status_desc
      t.integer :contractor_id
      t.integer :state_id

      t.timestamps
    end
  end
end
