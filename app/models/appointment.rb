class Appointment < ApplicationRecord
  belongs_to :patient, inverse_of: :appointments, optional: true
  belongs_to :doctor, inverse_of: :appointments

  DURATION_TIME = 1800 # appoitment time slot
end
