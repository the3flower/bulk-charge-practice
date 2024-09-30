class RemoveFilePathFromCsvFiles < ActiveRecord::Migration[7.2]
  def change
    remove_column :csv_files, :file_path, :string
  end
end
