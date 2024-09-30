class ProcessCsvJob < ApplicationJob
  queue_as :default

  def perform(csv_file_id)
    # Fetch the CSV
    csv_file = CsvFile.find(csv_file_id)

    # Update status to in_process
    csv_file.update(status: "in_process")

    # Read the attached CSV file
    csv_data = CSV.read(csv_file.file.download, headers: true)

    csv_data.each do |row|
      begin
        # Call the methods to generate token and charge
        token = generate_token(row)
        charge = create_charge(token, row)

        # Log the transaction in the transactions table
        Transaction.create!(
          csv_file_id: csv_file.id,
          token: token,
          currency: row["currency"],
          amount: row["amount"].to_i,
          status: "success",
          api_response: charge
        )
      rescue => e
        # If an error occurs, log it
        Transaction.create!(
          csv_file_id: csv_file.id,
          token: nil,
          currency: row["currency"],
          amount: row["amount"].to_i,
          status: "failed",
          api_response: { error: e.message }
        )
      end
    end

    # After processing all rows, update the status of the CSV file
    if csv_file.transactions.where(status: "failed").any?
      csv_file.update(status: "finished_with_errors")
    else
      csv_file.update(status: "finished")
    end
  end

  private

  def generate_token(row)
    # Simulate API request to generate a token
    # Replace with your actual API call logic
    "token_#{SecureRandom.hex(10)}"
  end

  def create_charge(token, row)
    # Simulate API request to create a charge
    # Replace with your actual API call logic
    { status: "success", charge_id: SecureRandom.hex(10) }
  end
end
