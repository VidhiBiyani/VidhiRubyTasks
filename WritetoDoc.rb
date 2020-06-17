#Create a new doc file
f = File.new("./my_file1.doc","w")
#writing text into document
f.puts("Hello")
f.puts("How are you vidhi")
f.puts("Learning ruby ")
#close the connection
f.close