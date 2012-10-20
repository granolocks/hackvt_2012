require 'rubygems'
require 'csv'
headers = %w{ name website address latitude longitude description }
CSV.foreach("activities.csv", {:headers => true, :quote_char=>'"', :col_sep =>","}) do |row_data|


  new_record = {}
  headers.each do |h|
    new_record[h] = row_data[h]
  end

  puts new_record.inspect
end
