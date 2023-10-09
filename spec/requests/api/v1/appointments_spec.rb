require 'rails_helper'

RSpec.describe "Api::V1::Appointments", type: :request do
  describe "PUT /create" do
    let!(:doctor) { create(:doctor) }
    let!(:appointment) { create(:appointment, doctor: doctor) }
    let!(:patient) { create(:patient) }

    context 'with valid params' do
      let(:payload) do
        {
          patient_id: patient.id,
          appointment_id: appointment.id
        }
      end

      it 'assing Patient to doctor appointment' do
        expect(patient.appointments.size).to eq 0

        put "/api/v1/appointments/book_visit", params: payload

        expect(response.status).to eq 201
        expect(JSON.parse(response.body)['data']).not_to be_empty
        expect(patient.appointments.reload.size).to eq 1
      end

    end

    context 'with invalid params' do
      let(:payload) do
        {
          patient_id: nil,
          appointment_id: appointment.id
        }
      end

      it 'return errors' do
        put "/api/v1/appointments/book_visit", params: payload

        expect(response.status).to eq 404
        expect(response.body).to eq 'record_not_found'
      end

    end
  end

  describe "PUT /update" do
    let!(:doctor) { create(:doctor) }
    let!(:appointment) { create(:appointment, doctor: doctor) }
    let!(:new_doctor) { create(:doctor) }
    let!(:patient) { create(:patient) }

    context 'with valid params' do
      let(:payload) do
        {
          appointment_id: appointment.id,
          cancelled: false,
          appointment_date: 2.days.from_now,
          doctor_id: new_doctor.id
        }
      end

      it 'update succesfully' do
        put "/api/v1/appointments/update_visit", params: payload

        expect(response.status).to eq 201

        res = JSON.parse(response.body)['data']['attributes']
        expect(res['doctor']).to eq new_doctor.full_name
      end
    end

    context 'with empty params' do
      let(:payload) do
        {
          appointment_id: appointment.id,
          cancelled: nil,
          appointment_date: nil,
          doctor_id: nil
        }
      end

      it 'return succesfully' do
        put "/api/v1/appointments/update_visit", params: payload

        expect(response.status).to eq 201
      end
    end

    context 'with not allowed params' do
      let(:payload) do
        {
          appointment_id: appointment.id,
          cancelled: false,
          appointment_date: 2.days.from_now,
          doctor_id: doctor.id,
          patient_id: patient.id
        }
      end

      it 'return succesfully' do
        put "/api/v1/appointments/update_visit", params: payload

        expect(response.status).to eq 201
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:appointment) { create(:appointment) }

    context 'with valid params' do
      let(:payload) { { appointment_id: appointment.id } }

      it 'destroy entity succesfully' do
        delete "/api/v1/appointments/remove_visit", params: payload

        expect(response.status).to eq 204
      end
    end

    context 'with invalid params' do
      let(:payload) { { appointment_id: nil } }

      it 'return error record not found' do
        delete "/api/v1/appointments/remove_visit", params: payload

        expect(response.status).to eq 404
        expect(response.body).to eq 'record_not_found'
      end
    end
  end
end
