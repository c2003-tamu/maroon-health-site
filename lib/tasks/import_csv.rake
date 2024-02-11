require 'csv'

namespace :import do
  desc "Import data from CSV"
  task :medications => :environment do
    file_path = 'lib/tasks/clinicData.csv' # Path to your CSV file
    
    CSV.foreach(file_path, headers: true) do |row|
      name = row['name'].to_s
      stock = row['stock'].to_i
      notes = row['notes'].to_s
        
      Medication.create!(name: name, stock: stock, notes: notes)
    end
  end
end

