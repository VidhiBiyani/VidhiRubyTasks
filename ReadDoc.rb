begin
lines = []
#Open a file for reading
file  = File.open("./my_file1.doc","r")

# Read the lines from the doc file
while (line=file.gets)
  lines << line
end
lines.each { |l| puts l }
end
#Close file
file.close









