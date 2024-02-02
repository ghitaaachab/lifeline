# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_31_122434) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergies", force: :cascade do |t|
    t.string "type"
    t.bigint "patient_sheet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_sheet_id"], name: "index_allergies_on_patient_sheet_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.string "doctor_name"
    t.datetime "date"
    t.boolean "reminder"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "diseases", force: :cascade do |t|
    t.string "name"
    t.bigint "patient_sheet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_sheet_id"], name: "index_diseases_on_patient_sheet_id"
  end

  create_table "medical_files", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "treating_dr"
    t.string "file_id"
    t.date "date"
    t.string "notes"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_medical_files_on_user_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.string "notes"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_medicines_on_user_id"
  end

  create_table "patient_sheets", force: :cascade do |t|
    t.string "blood_type"
    t.string "height"
    t.string "weight"
    t.string "family_history"
    t.string "surgical_history"
    t.string "emergency_contact_number"
    t.string "emergency_contact_name"
    t.string "current_dr"
    t.string "current_tt"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patient_sheets_on_user_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.date "date"
    t.string "assigned_dr"
    t.string "description"
    t.bigint "medical_file_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_file_id"], name: "index_prescriptions_on_medical_file_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_symptoms_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.bigint "medical_file_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_file_id"], name: "index_tests_on_medical_file_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "date_of_birth"
    t.string "address"
    t.string "phone_number"
    t.string "social_status"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vital_signs", force: :cascade do |t|
    t.string "label"
    t.string "value"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vital_signs_on_user_id"
  end

  add_foreign_key "allergies", "patient_sheets"
  add_foreign_key "appointments", "users"
  add_foreign_key "diseases", "patient_sheets"
  add_foreign_key "medical_files", "users"
  add_foreign_key "medicines", "users"
  add_foreign_key "patient_sheets", "users"
  add_foreign_key "prescriptions", "medical_files"
  add_foreign_key "symptoms", "users"
  add_foreign_key "tests", "medical_files"
  add_foreign_key "vital_signs", "users"
end
