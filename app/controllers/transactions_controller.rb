class TransactionsController < ApplicationController
  http_basic_authenticate_with name: ENV["BASIC_AUTH_NAME"], password: ENV["BASIC_AUTH_PASSWORD"]

  def index
    render plain: "Transaction page"
  end

  def create
    render plain: "Transaction page: auth block"
  end

  def show
    render plain: "Transaction page: auth block"
  end
end
