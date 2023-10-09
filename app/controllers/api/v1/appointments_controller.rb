module Api
  module V1
    class AppointmentsController < ApplicationController
      before_action :load_appointment
      before_action :load_patient, only: :create

      def create
        @appointment.update!(patient_id: @patient.id)

        render json: AppointmentSerializer.new(@appointment).serializable_hash.to_json, status: 201
      end

      def update
        attrs = permitted_params.slice(:cancelled, :appointment_date, :doctor_id).compact

        @appointment.update!(attrs) unless attrs.empty?

        render json: AppointmentSerializer.new(@appointment).serializable_hash.to_json, status: 201
      end

      def destroy
        @appointment.destroy

        render json: {}, status: 204
      end

      private

      def permitted_params
        params.permit(:appointment_id, :patient_id, :doctor_id, :appointment_date, :cancelled)
      end

      def load_patient
        @patient ||= Patient.find(permitted_params[:patient_id])
      end

      def load_appointment
        @appointment ||= Appointment.find(permitted_params[:appointment_id])
      end
    end
  end
end