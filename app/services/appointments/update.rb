# frozen_string_literal: true

module Appointments
  class Update
    def initialize(appointment_id:, params:)
      @appointment_id = appointment_id
      @params = params
    end

    def call
      appointment.update(update_payload) unless params.empty?

      appointment
    end

    private

    attr_accessor :appointment_id, :params

    def appointment
      @appointment ||= Appointment.find(appointment_id)
    rescue ActiveRecord::RecordNotFound => e
      { success: false, message: e.to_s }
    end

    # we don\'t want to update all attributes
    def update_payload
      params.slice(*allowed_update_attributes)
    end

    def allowed_update_attributes
      %w[patient_id cancelled doctor_id]
    end
  end
end
