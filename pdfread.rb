require 'pdf-reader'

reader = PDF::Reader.new("sample.pdf")

puts reader.pdf_version
puts reader.info
puts reader.metadata
puts reader.page_count

reader.pages.each do |page|
puts page.text
end
