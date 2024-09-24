class CsvFilesController < ApplicationController
  http_basic_authenticate_with name: ENV["BASIC_AUTH_NAME"], password: ENV["BASIC_AUTH_PASSWORD"]

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
