# frozen_string_literal: true

class Avability < ApplicationRecord
  belongs_to :doctor, inverse_of: :avabilities

  after_commit :create_appointments, on: :create

  with_options presence: true do
    validates :doctor_id, :weekday, :start_time, :end_time
    validates_uniqueness_of :weekday, :start_time, :end_time, scope: :doctor_id
  end

  private

  def create_appointments
    slots = calculate_appoitments_day
    slots.each do |day|
      first_slot = day + Time.parse(start_time).seconds_since_midnight.seconds
      last_slot = day + (Time.parse(end_time).seconds_since_midnight.seconds - Appointment::DURATION_TIME)

      (first_slot.to_i..last_slot.to_i).step(Appointment::DURATION_TIME) do |slot_date|
        doctor.appointments.create!(appointment_date: Time.zone.at(slot_date).to_datetime)
      end
    end
  end

  def calculate_appoitments_day
    today = DateTime.current.at_midnight
    today.upto(today.advance(months: 6)).select { |date| date.wday == weekday }
  end
end
