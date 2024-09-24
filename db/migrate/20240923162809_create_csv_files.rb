class CreateCsvFiles < ActiveRecord::Migration[7.2]
  def change
    create_table :csv_files do |t|
      t.string :file_name
      t.string :file_path
      t.datetime :upload_at

      t.timestamps
    end
  end
end
