require 'factory_bot'

FactoryBot.define do
  factory :doctor do
    first_name { FFaker::NameNL.first_name }
    last_name { FFaker::NameNL.last_name }
    specialization { %w[Psychiatry Pediatrics Surgery].sample }
    email { FFaker::Internet.email }
  end
end