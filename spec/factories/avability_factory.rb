require 'factory_bot'

FactoryBot.define do
  factory :avability, class: Avability do
    doctor { create(:doctor) }
    weekday { rand(0..6) }
    start_time { %w[8am 9am 7am 10am 11am].sample }
    end_time { %w[2pm 3pm 4pm 6pm 7pm 8pm 9pm].sample }
  end
end