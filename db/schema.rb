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

ActiveRecord::Schema[7.0].define(version: 20_231_008_110_917) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'appointments', force: :cascade do |t|
    t.integer 'doctor_id'
    t.integer 'patient_id'
    t.datetime 'appointment_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'cancelled', default: false
    t.index ['doctor_id'], name: 'index_appointments_on_doctor_id'
    t.index ['patient_id'], name: 'index_appointments_on_patient_id'
  end

  create_table 'avabilities', force: :cascade do |t|
    t.integer 'doctor_id'
    t.integer 'weekday'
    t.string 'start_time', null: false
    t.string 'end_time', null: false
    t.string 'notes'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['doctor_id'], name: 'index_avabilities_on_doctor_id'
  end

  create_table 'doctors', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'specialization'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'patients', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
