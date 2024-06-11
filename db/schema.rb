
ActiveRecord::Schema[7.0].define(version: 2024_06_10_075657) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accident_reports", force: :cascade do |t|
    t.text "description"
    t.date "date"
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_accident_reports_on_vehicle_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_owners_on_vehicle_id"
  end

  create_table "service_records", force: :cascade do |t|
    t.text "description"
    t.date "date"
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_service_records_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vin"
    t.string "make"
    t.string "model"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accident_reports", "vehicles"
  add_foreign_key "owners", "vehicles"
  add_foreign_key "service_records", "vehicles"
end
