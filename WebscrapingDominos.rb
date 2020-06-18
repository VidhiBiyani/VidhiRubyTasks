# load in the webdriver gem to interect with selenium
require 'selenium-webdriver'
#setup chrome plugin
#driver = Selenium::WebDriver::Chrome.driver_path='C:\Users\vidhi\Desktop\Ruby Folder\chromedriver.exe'

#this line will start the browser
driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 20)

def document_initialised(driver)
  driver.execute_script('return initialised')
end
#Navigate to URl
driver.get "https://pizzaonline.dominos.co.in/menu"

wait.until{|document_initialised| driver}
search= driver.find_element(:css,"span[class='rupee']").text
"Hello from JavaScript!".eql? search
#Maximize the window
driver.manage.window.maximize
driver.manage.timeouts.implicit_wait = 20
i=1
for i in 1..15
  #scrap the Name of pizza
  title=driver.find_element(:xpath,"(//span[@class='itm-dsc__nm'])[#{i}]").text
  puts "the title of pizza #{i} is "+title
  sleep  4

  #Scrap the price of pizza
  price=driver.find_element(:xpath,"(//span[@class='rupee'])[#{i}]").text
  puts "the price of pizza #{i} is "+price
  sleep 4

  #Scrap the description of pizza
  description=driver.find_element(:xpath,"(//span[@class='itm-dsc__dscrptn'])[#{i}]").text
  puts "the description of pizza #{i} is "+description
  sleep 4

  #Scrap the size of pizza
  size=driver.find_element(:xpath,"(//div[@class='itm-dsc__actn__sz__dd-ttl'])[#{i}]").text
  puts "size of pizza#{i} is "+size
  sleep 2

  #Scrap the taste of pizza
  crust=driver.find_element(:xpath,"(//div[@class='itm-dsc__actn__crst'])[#{i}]").text
  puts "taste of pizza#{i} is "+crust
  sleep 3
end

