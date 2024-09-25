class CsvFilesController < ApplicationController
  def index
    render "index"
  end

  def upload
    render plain: "csv files page: upload"
  end

  def download
    render plain: "csv files page: download"
  end

  def destroy
    render plain: "csv files page: delete"
  end
end
