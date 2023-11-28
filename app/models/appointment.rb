# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :patient, inverse_of: :appointments, optional: true
  belongs_to :doctor, inverse_of: :appointments

  with_options presence: true do
    validates :doctor_id, :appointment_date
  end

  DURATION_TIME = 1800 # appoitment time slot
end
