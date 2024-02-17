# frozen_string_literal: true

require 'csv'

namespace :import do
  desc 'Import data from CSV'
  task medications: :environment do
    # Path to your CSV file
    file_path = 'lib/tasks/clinicData.csv'

    CSV.foreach(file_path, headers: true) do |row|
      name = row['name'].to_s
      stock = Integer(row['stock'], 10)
      notes = row['notes'].to_s

      Medication.create!(name: name, stock: stock, notes: notes)
    end
  end
end
