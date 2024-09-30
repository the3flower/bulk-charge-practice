class PaymentGatewayService
  def initialize(token_id, amount, currency)
    @token_id = token_id
    @amount = amount
    @currency = currency
  end

  def create_charge
    # Example API call to create a charge (replace with your actual API details)
    response = RestClient.post(
      "https://api.paymentgateway.com/charges",
      {
        token_id: @token_id,
        amount: @amount,
        currency: @currency
      }
    )

    # Parse the JSON response from the API
    JSON.parse(response.body)
  rescue RestClient::ExceptionWithResponse => e
    # Handle errors from the API call
    { "status" => "failed", "error_message" => e.response }
  end
end
