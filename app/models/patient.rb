# frozen_string_literal: true

class Patient < ApplicationRecord
  has_many :appointments, inverse_of: :patient
  has_many :doctors, through: :appointments

  with_options presence: true do
    validates :first_name, :last_name, :email
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
