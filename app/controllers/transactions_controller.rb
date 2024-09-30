class TransactionsController < ApplicationController
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
