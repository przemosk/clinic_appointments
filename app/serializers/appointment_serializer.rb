class AppointmentSerializer
  include JSONAPI::Serializer

  attributes :id, :cancelled

  attribute :doctor do |entry|
    entry.doctor.full_name
  end

  attribute :specialization do |entry|
    entry.doctor.specialization
  end

  attribute :patient, if: Proc.new { |entry| entry.patient.present? } do |object|
    object.patient.full_name
  end

  attribute :appointment_date do |entry|
    entry.appointment_date.to_formatted_s(:long)
  end
end
