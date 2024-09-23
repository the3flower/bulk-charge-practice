class CsvFilesController < ApplicationController
  http_basic_authenticate_with name: "bill", password: "password"

  def index
    render plain: "csv files page"
  end

  def upload
  end

  def download
    render plain: "csv files page: auth block"
  end
end
