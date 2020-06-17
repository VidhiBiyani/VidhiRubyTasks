require 'csv'

CSV.open('testvidhi.csv','wb') do |csv|
  #Write the data into the csv file
  csv << ['Name',"Designation","Age"]
  csv << ['Vidhi','QA','27']
  csv << ['Manisha','jr QA','24']
  csv << ['test','developer','26']
end

require 'csv'
CSV.foreach('testvidhi.csv') do |row|
  puts row.inspect
end