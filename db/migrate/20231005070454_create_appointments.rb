class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.integer :doctor_id, index: true, foreign_key: true
      t.integer :patient_id, index: true, foreign_key: true

      t.datetime :appointment_date

      t.timestamps
    end
  end
end
