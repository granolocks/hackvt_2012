require 'rubygems'
require 'csv'

files = %w{ farmers_markets hikes historical_sites museums ski_resorts swimming_holes }

headers = %w{ name website address latitude longitude description }

files.each do |f|
  out = []

  CSV.foreach("#{f}.csv", {:headers => true, :quote_char=>'"', :col_sep =>","}) do |row_data|
    new_record = {}
    headers.each do |h|
      new_record[h] = row_data[h]
    end
    out << new_record
  end
  out_file = File.open("#{f}.rb","w+")
  out_file.write(out.inspect)
  out_file.close
end
