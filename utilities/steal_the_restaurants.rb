require 'rubygems'
require 'factual'
require 'pry'

out = []
f = Factual.new("2jvaClO0l0I9jrbpVfYFZnl1JaXCxlUElATebp26","F5zrwGUNoVCqYAZvxAqf44QrnSEJe5nOdc5qivNU")

done = false
current_page = 1
while (done == false) do
  begin
    rows = f.table("restaurants-us").filters({"region" => "vt"}).page(current_page, :per => 30).rows
    out << rows
    current_page += 1
    sleep(1)
    puts "Page: #{current_page}"
  rescue StandardError
    done = true
  end
end

f = File.open("outfile.txt", "w+")
f.write(out.flatten.inspect)
f.close
