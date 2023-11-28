# frozen_string_literal: true

class AvabilitySerializer
  include JSONAPI::Serializer

  attributes :id, :start_time, :end_time

  attribute :weekday do |entry|
    Date::DAYNAMES[entry.weekday]
  end
end
