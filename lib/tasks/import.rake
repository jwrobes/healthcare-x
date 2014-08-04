require 'csv'

desc 'Imports CSV file into Active Record Table'
namespace :import do
  task :insurance_data => :environment do
 		csv_insurance = File.open('insurance_data_full.csv',"r:ISO-8859-1")
 		csv = CSV.parse(csv_insurance, :headers => true)
 		csv.each do |row|
 			HealthPlan.create!(row.to_hash)
  	end
  end
end

