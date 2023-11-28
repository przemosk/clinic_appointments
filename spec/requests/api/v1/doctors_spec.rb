# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Doctors', type: :request do
  let!(:doctor) { create(:doctor) }

  describe 'GET /available_slots' do
    context 'with valid doctor_id param' do
      let!(:available_slot) { create(:appointment, doctor:) }

      it 'return status 200 and available slots' do
        get '/api/v1/doctors/available_slots', params: { doctor_id: doctor.id }

        expect(response.status).to eq 200
        expect(JSON.parse(response.body)['data']).not_to be_empty
      end
    end

    context 'with missing doctor_id param' do
      it 'return error status' do
        get '/api/v1/doctors/available_slots', params: { doctor_id: nil }

        expect(response.status).to eq 404
        expect(response.body).to eq 'record_not_found'
      end
    end
  end

  describe 'GET /working_hours' do
    context 'with valid doctor_id param' do
      let!(:avability) { create(:avability, doctor:) }

      it 'return status 200 and working hours' do
        get '/api/v1/doctors/working_hours', params: { doctor_id: doctor.id }

        expect(response.status).to eq 200
        expect(JSON.parse(response.body)['data']).not_to be_empty
      end
    end

    context 'with invalid doctor_id param' do
      it 'return error record not found' do
        get '/api/v1/doctors/working_hours', params: { doctor_id: nil }

        expect(response.status).to eq 404
        expect(response.body).to eq 'record_not_found'
      end
    end
  end
end
