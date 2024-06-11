class CreateOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end