class CsvFile < ApplicationRecord
  has_one_attached :file
  has_many :transactions, dependent: :destroy

  validates :file_name, presence: true
  validates :file, presence: true
end
