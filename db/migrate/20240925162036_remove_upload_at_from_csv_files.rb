class RemoveUploadAtFromCsvFiles < ActiveRecord::Migration[7.2]
  def change
    remove_column :csv_files, :upload_at
  end
end
