# require 'csv'

# namespace :import do

#   desc "Import Businesses from csv"

#   task :businesses, [:file] => :environment do |task, args|
#     counter = 0
#     records = 0

#     filename = File.join Rails.root, args.file

#     begin
#       CSV.foreach(filename, headers: true) do |row|
#         unless Business.find_by(id: row["id"])
#           business = Business.create(row.to_hash)
#           counter += 1 if business.persisted?
#         end
#         records += 1
#       end
#     rescue => e
#       p "error: #{e}"
#     end
#     puts "Imported #{counter} of #{records} records"
#   end
# end
require 'csv'

namespace :import do

  desc "Import Businesses from csv"

  task :businesses, [:file] => :environment do |task, args|
    counter = 0
    records = 0

    if File.extname(args.file) == ".gz"
      gzipped = open(args.file)
      csv_text = Zlib::GzipReader.new(gzipped).read
      csv = CSV.parse(csv_text, headers: true)
      begin
        csv.each do |row|
          unless Business.find_by(id: row["id"])
            business = Business.create(row.to_hash)
            counter += 1 if business.persisted?
          end
          records += 1
          end
      rescue => e
        p "error: #{e}"
      end

    else
      filename = File.join Rails.root, args.file
      begin
        CSV.foreach(filename, headers: true) do |row|
        unless Business.find_by(id: row["id"])
          business = Business.create(row.to_hash)
          counter += 1 if business.persisted?
        end
        records += 1
        end
      rescue => e
        p "error: #{e}"
      end
    end
    
    puts "Imported #{counter} of #{records} records"
  end
end