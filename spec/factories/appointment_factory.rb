require 'factory_bot'

FactoryBot.define do
  factory :appointment, class: Appointment do
    doctor { create(:doctor) }
    appointment_date { DateTime.tomorrow }
  end
end
