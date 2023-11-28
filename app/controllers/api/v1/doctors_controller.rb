# frozen_string_literal: true

module Api
  module V1
    class DoctorsController < ApplicationController
      before_action :load_doctor

      def working_hours
        render json: AvabilitySerializer.new(@doctor.avabilities), status: 200
      end

      def available_slots
        render json: AppointmentSerializer.new(@doctor.available_slots), status: 200
      end

      private

      def permitted_params
        params.permit(:doctor_id)
      end

      def load_doctor
        @doctor ||= Doctor.find(permitted_params[:doctor_id])
      end
    end
  end
end
