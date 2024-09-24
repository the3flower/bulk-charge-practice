class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.references :csv_file, null: false, foreign_key: true
      t.string :token
      t.string :currency
      t.integer :amount
      t.string :status
      t.json :api_response

      t.timestamps
    end
  end
end
