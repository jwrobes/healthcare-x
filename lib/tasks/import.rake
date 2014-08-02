require 'csv'

desc 'Imports CSV file into Active Record Table'
namespace :import do
  task :insurance_data => :environment do
 		csv_insurance = File.read('insurance_data.csv')
 		csv = CSV.parse(csv_insurance, :headers => true)
 		csv.each do |row|
 			InsurancePlan.create!(row.to_hash)
  	end
  end
end

