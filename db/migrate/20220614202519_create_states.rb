class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states do |t|
      t.string :name
      t.string :name_abbrev

      t.timestamps
    end
  end
end
