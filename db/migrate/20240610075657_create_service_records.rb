class CreateServiceRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :service_records do |t|
      t.text :description
      t.date :date
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
