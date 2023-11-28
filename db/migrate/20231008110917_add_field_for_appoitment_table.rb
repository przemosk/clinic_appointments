# frozen_string_literal: true

class AddFieldForAppoitmentTable < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :cancelled, :boolean, default: false
  end
end
