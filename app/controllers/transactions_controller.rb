class TransactionsController < ApplicationController
  http_basic_authenticate_with name: "bill", password: "1234"

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
