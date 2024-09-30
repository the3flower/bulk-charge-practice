class ProcessCsvJob < ApplicationJob
  queue_as :default

  def perform(csv_file_id)
    csv_file = CsvFile.find(csv_file_id)
    logger.debug "Starting background job for CSV file ID: #{csv_file_id}"
    csv_file.update(status: "in_process")

    # Read the CSV file content
    file_content = csv_file.file.download

    # Parse the CSV content
    csv_data = CSV.parse(file_content, headers: true)

    csv_data.each do |row|
      begin
        # Extract card details from the CSV row
        card_details = extract_card_details(row)

        # Generate token using TokenApiService
        token_response = TokenApiService.new(card_details).create_token
        token_id = token_response["id"]

        # Create charge using the generated token
        charge_response = PaymentGatewayService.new(token_id, row["charge_amount"], row["charge_currency"]).create_charge

        # Log the transaction as successful if charge was created
        Transaction.create!(
          csv_file_id: csv_file.id,
          token: token_id,  # token ID from response
          amount: row["charge_amount"],
          currency: row["charge_currency"],
          status: charge_response["status"],  # e.g., "success", "failed"
          api_response: charge_response  # Store the API response if needed
        )
      rescue => e
        # Log the transaction as failed
        Transaction.create!(
          csv_file_id: csv_file.id,
          amount: row["charge_amount"],
          currency: row["charge_currency"],
          status: "failed",
          # Optionally, store the error message
          # error_message: e.message
        )
      end
    end

    csv_file.update(status: "finished")
  end

  private

  def extract_card_details(row)
    {
      card_name: row["card_name"],
      card_number: row["card_number"],
      expiration_month: row["card_expiration_month"],
      expiration_year: row["card_expiration_year"],
      card_city: row["card_city"],
      card_postal_code: row["card_postal_code"],
      card_security_code: row["card_security_code"]
    }
  end
end
