class ChangeAvabilityColumnMigration < ActiveRecord::Migration[7.0]
  def change
    change_column :avabilities, :start_time, :string, null: false, index: true
    change_column :avabilities, :end_time, :string, null: false, index: true

    remove_column :avabilities, :available
  end
end
