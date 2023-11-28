# frozen_string_literal: true

class CreateAvabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :avabilities do |t|
      t.boolean :available, default: false

      t.integer :doctor_id, index: true, foreign_key: true
      t.integer :weekday
      t.integer :start_time
      t.integer :end_time

      t.string :notes

      t.timestamps
    end
  end
end
