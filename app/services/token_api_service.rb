require "http"

class TokenApiService
  def initialize(card_details)
    @card_details = card_details
    @public_key = ENV["OPN_PUBLIC_KEY"]
  end

  def create_token
    response = HTTP.headers(
      "Authorization" => "Basic #{Base64.strict_encode64(@public_key + ":")}",
      "Content-Type" => "application/x-www-form-urlencoded"
    ).post("https://vault.omise.co/tokens", form: format_card_data)

    handle_response(response)
  end

  private

  def format_card_data
    {
      "card[number]" => @card_details[:card_number],
      "card[expiration_month]" => @card_details[:expiration_month],
      "card[expiration_year]" => @card_details[:expiration_year],
      "card[name]" => @card_details[:card_name],
      "card[city]" => @card_details[:card_city],
      "card[postal_code]" => @card_details[:card_postal_code],
      "card[security_code]" => @card_details[:card_security_code]
    }
  end

  def handle_response(response)
    if response.status.success?
      JSON.parse(response.body.to_s)
    else
      raise "Error generating token: #{response.body}"
    end
  end
end
