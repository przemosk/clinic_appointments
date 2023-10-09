class Doctor < ApplicationRecord
  has_many :appointments, inverse_of: :doctor
  has_many :avabilities, inverse_of: :doctor
  has_many :patients, through: :appointments

  with_options presence: true do
    validates :first_name, :last_name, :specialization, :email
  end

  def available_slots
    appointments.where('patient_id IS NULL AND cancelled IS FALSE')
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
