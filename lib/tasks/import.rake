require 'csv'
desc 'Imports CSV file into Active Record Table'
namespace :import do
  task :insurance_data => :environment do
 		csv_test = File.read('insurance_data.csv')
 		csv = CSV.parse(csv_text, :headers => true)
 		csv.each do |row|
 			InsurancePlan.create!(row.to_hash)
  end
end 