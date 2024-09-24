class CsvFilesController < ApplicationController
  http_basic_authenticate_with name: "bill", password: "1234"

  def index
    render plain: "csv files page"
  end

  def upload
    render plain: "csv files page: upload"
  end

  def download
    render plain: "csv files page: download"
  end
end
