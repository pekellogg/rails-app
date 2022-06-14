class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :type
      t.boolean :status
      t.text :desc
      t.integer :contractor_id
      t.integer :user_id

      t.timestamps
    end
  end
end
