class CsvFilesController < ApplicationController
  before_action :set_csv_file, only: [ :download, :destroy ]

  def index
    @csv_files = CsvFile.all
  end

  def new
    @csv_file = CsvFile.new
  end

  def upload
    @csv_file = CsvFile.new(csv_file_params)

    if @csv_file.save
      @csv_file.file.attach(params[:csv_file][:file])
      redirect_to csv_files_path, notice: "File uploaded successfully."
    else
      render :new
    end
  end

  def download
    if @csv_file.file.attached?
      redirect_to rails_blob_path(@csv_file.file, disposition: "attachment")
    else
      redirect_to csv_files_path, alert: "File not found."
    end
  end

  def destroy
    @csv_file.file.purge # Deletes the file
    @csv_file.destroy
    redirect_to csv_files_path, notice: "File deleted successfully."
  end

  private

  def set_csv_file
    @csv_file = CsvFile.find(params[:id]) # This finds the CSV file by the provided ID
  end

  def csv_file_params
    params.require(:csv_file).permit(:file_name, :file)
  end
end
