require 'factory_bot'

FactoryBot.define do
  factory :patient, class: Patient do
    first_name { FFaker::NameNL.first_name }
    last_name { FFaker::NameNL.last_name }
    email { FFaker::Internet.email }
  end
end