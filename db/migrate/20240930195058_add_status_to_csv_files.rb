class AddStatusToCsvFiles < ActiveRecord::Migration[7.0]
  def change
    add_column :csv_files, :status, :string, default: "pending"
  end
end
