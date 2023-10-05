class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments

  with_options presence: true do
    validates :first_name, :last_name, :specialization, :email
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
